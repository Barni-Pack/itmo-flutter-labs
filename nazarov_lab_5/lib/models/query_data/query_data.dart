import 'package:hive/hive.dart';

part 'query_data.g.dart';

@HiveType(typeId: 0)
class QueryData {
  @HiveField(0)
  final String foundedQuestion;

  @HiveField(1)
  final String foundedAnswer;

  @HiveField(2)
  final DateTime queryExecuteDateTime;

  QueryData({
    required this.foundedQuestion,
    required this.foundedAnswer,
    required this.queryExecuteDateTime,
  });
}
