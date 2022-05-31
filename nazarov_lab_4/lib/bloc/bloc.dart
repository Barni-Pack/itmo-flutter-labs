import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../question_model.dart';
import 'event.dart';
import 'state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(InitialState()) {
    on<LoadDataEvent>(_loadData);
  }

  Future<void> _loadData(LoadDataEvent event, Emitter<QuestionState> emit) async {
    try {
      emit(LoadingState());
      final uri = Uri.parse("http://jservice.io/api/random?count=1");
      final response = await http.get(uri);
      final decodedResponse = jsonDecode(response.body);
      final question = QuestionModel.fromJson(decodedResponse);
      emit(LoadedState(question: question));
    } catch (e) {
      emit(FailedState(errorMessage: e.toString()));
    }
  }
}
