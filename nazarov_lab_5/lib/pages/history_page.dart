import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<QuestionProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text("История запросов")),
      body: Center(
        child: providerWatch.isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: providerWatch.queriesHistory.length,
                  itemBuilder: (context, index) {
                    final foundedQuery = providerWatch.queriesHistory[index];
                    return ListTile(
                      title: Text(foundedQuery.foundedQuestion),
                      subtitle: Text(foundedQuery.foundedAnswer),
                      trailing: Text(
                        "${foundedQuery.queryExecuteDateTime.day}.${foundedQuery.queryExecuteDateTime.month}.${foundedQuery.queryExecuteDateTime.year} ${foundedQuery.queryExecuteDateTime.hour}:${foundedQuery.queryExecuteDateTime.minute}",
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
