import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Exam> exams = [
    Exam(subject: "SP", dateTime: DateTime(2025, 8, 29, 12, 30), laboratories: ['lab13', 'lab12']),
    Exam(subject: "APS", dateTime: DateTime(2025, 12, 1, 8, 0), laboratories: ['lab138', 'lab215']),
    Exam(subject: "WP", dateTime: DateTime(2026, 1, 13, 18, 30), laboratories: ['lab13', 'lab12']),
    Exam(subject: "MIS", dateTime: DateTime(2025, 11, 17, 9, 0), laboratories: ['lab2']),
    Exam(subject: "BP", dateTime: DateTime(2025, 9, 30, 10, 30), laboratories: ['lab3', 'lab12']),
    Exam(subject: "EMT", dateTime: DateTime(2026, 6, 18, 11, 30), laboratories: ['lab138', 'lab12']),
    Exam(subject: "VNP", dateTime: DateTime(2025, 11, 16, 16, 30), laboratories: ['lab215', 'lab12', 'lab2']),
    Exam(subject: "KMB", dateTime: DateTime(2025, 11, 10, 12, 0), laboratories: ['b3.2', 'lab12']),
    Exam(subject: "OOP", dateTime: DateTime(2025, 6, 19, 15, 0), laboratories: ['lab12']),
    Exam(subject: "AOK", dateTime: DateTime(2026, 6, 14, 9, 30), laboratories: ['lab3', 'lab12']),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Распоред на испити - 223007",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ExamGrid(exams: exams),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue.shade50,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Вкупен број на испити: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                exams.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
