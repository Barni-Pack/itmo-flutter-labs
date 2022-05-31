import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final provider = context.watch<QuestionProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Вопрос номер ${provider.question?.id}")),
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Вопрос: ${provider.question?.question}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    if (showAnswer) const SizedBox(height: 10),
                    if (showAnswer)
                      Text(
                        "Ответ: ${provider.question?.answer}",
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
