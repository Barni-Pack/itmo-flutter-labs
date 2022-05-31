import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'question_model.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool isLoading = false;
  bool showAnswer = false;
  QuestionModel? question;

  Future<void> fetchQuestion() async {
    isLoading = true;
    setState(() {});
    final uri = Uri.parse("http://jservice.io/api/random?count=1");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      question = QuestionModel.fromJson(decodedResponse);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Вопрос номер ${question?.id}")),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Вопрос: ${question?.question}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    if (showAnswer) const SizedBox(height: 10),
                    if (showAnswer)
                      Text(
                        "Ответ: ${question?.answer}",
                        style: const TextStyle(fontSize: 24, color: Colors.green),
                      ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showAnswer = !showAnswer;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: mediaQuery.size.width,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Center(
                          child: Text(
                            showAnswer ? "Спрятать ответ" : "Показать ответ",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
