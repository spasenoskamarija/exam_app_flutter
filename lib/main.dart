import 'package:flutter/material.dart';
import 'package:exam_app/screens/details_page.dart';
import 'package:exam_app/screens/home_page.dart';
import '../models/exam_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Schedule',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/details") {
          final exam = settings.arguments as Exam;
          return MaterialPageRoute(
            builder: (context) => DetailsPage(exam: exam),
          );
        }
        return null;
      },
    );
  }
}
