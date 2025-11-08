import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class DetailsPage extends StatelessWidget {
  final Exam exam;

  const DetailsPage({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime examDateTime = exam.dateTime;

    String remainingText;
    if (examDateTime.isBefore(now)) {
      remainingText = "Испитот е завршен";
    } else {
      final duration = examDateTime.difference(now);
      final days = duration.inDays;
      final hours = duration.inHours % 24;
      remainingText = "$days дена, $hours часа до испитот";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          exam.subject,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Испит по ${exam.subject}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "Датум: ${DateFormat('dd/MM/yyyy').format(exam.dateTime)}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Време: ${DateFormat('HH:mm').format(exam.dateTime)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              remainingText,
              style: TextStyle(
                fontSize: 18,
                color: examDateTime.isBefore(now) ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
