import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/question_summary_item.dart';
import 'question_summary_tile.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.questionSummaryItems});

  final List<QuestionSummaryItem> questionSummaryItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
              questionSummaryItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;

                return QuestionSummaryTile(index: index, item: item);
              }).toList(),
        ),
      ),
    );
  }
}
