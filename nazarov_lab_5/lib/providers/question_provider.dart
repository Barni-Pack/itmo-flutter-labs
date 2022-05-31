import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

import '../models/query_data/query_data.dart';
import '../models/question/question_model.dart';

class QuestionProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  QuestionModel? _question;
  QuestionModel? get question => _question;

  final List<QueryData> _queriesHistory = [];
  List<QueryData> get queriesHistory => _queriesHistory;

  Future<void> fetchQuestion() async {
    _isLoading = true;
    notifyListeners();
    final uri = Uri.parse("http://jservice.io/api/random?count=1");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      _question = QuestionModel.fromJson(decodedResponse);
      saveToDatabase();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveToDatabase() async {
    _isLoading = true;
    notifyListeners();
    var box = await Hive.openBox<QueryData>('QueryData');
    box.add(
      QueryData(
        foundedQuestion: _question?.question ?? "-",
        foundedAnswer: _question?.answer ?? "-",
        queryExecuteDateTime: DateTime.now(),
      ),
    );
    _isLoading = false;
    notifyListeners();
  }

  Future<void> readDatabase() async {
    _queriesHistory.clear();
    _isLoading = true;
    notifyListeners();
    final box = await Hive.openBox<QueryData>('QueryData');
    _queriesHistory.addAll(box.values.toList());
    _isLoading = false;
    notifyListeners();
  }
}
