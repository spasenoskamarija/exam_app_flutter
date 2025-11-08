import 'package:flutter/material.dart';
import 'package:exam_app/widgets/card.dart';
import '../models/exam_model.dart';

class ExamGrid extends StatelessWidget {
  final List<Exam> exams;

  const ExamGrid({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 3,
      ),
      itemCount: exams.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamCard(exam: exams[index]);
      },
    );
  }
}
