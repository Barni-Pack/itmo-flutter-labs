import 'package:equatable/equatable.dart';
import 'package:nazarov_lab_4/question_model.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class InitialState extends QuestionState {}

class LoadingState extends QuestionState {}

class LoadedState extends QuestionState {
  final QuestionModel question;

  const LoadedState({required this.question});
}

class FailedState extends QuestionState {
  final String errorMessage;

  const FailedState({
    required this.errorMessage,
  });
}
