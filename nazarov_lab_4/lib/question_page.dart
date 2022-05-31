import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nazarov_lab_4/bloc/bloc.dart';
import 'package:nazarov_lab_4/bloc/state.dart';

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
    return Scaffold(
      appBar: AppBar(title: BlocBuilder<QuestionBloc, QuestionState>(builder: (context, state) {
        if (state is LoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is LoadedState) {
          return Text("Вопрос номер ${state.question.id}");
        }
        return const SizedBox.shrink();
      })),
      body: Center(
        child: BlocBuilder<QuestionBloc, QuestionState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is LoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Вопрос: ${state.question.question}",
                      style: const TextStyle(fontSize: 24),
                    ),
                    if (showAnswer) const SizedBox(height: 10),
                    if (showAnswer)
                      Text(
                        "Ответ: ${state.question.answer}",
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
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
