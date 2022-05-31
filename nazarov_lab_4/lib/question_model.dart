class QuestionModel {
  final dynamic id;
  final dynamic question;
  final dynamic answer;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  static QuestionModel fromJson(List<dynamic> json) {
    return QuestionModel(
      id: json[0]["id"],
      question: json[0]["question"],
      answer: json[0]["answer"],
    );
  }
}
