import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

import 'question_model.dart';

class QuestionProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  QuestionModel? _question;
  QuestionModel? get question => _question;

  Future<void> fetchQuestion() async {
    _isLoading = true;
    notifyListeners();
    final uri = Uri.parse("http://jservice.io/api/random?count=1");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      _question = QuestionModel.fromJson(decodedResponse);
    }
    _isLoading = false;
    notifyListeners();
  }
}
