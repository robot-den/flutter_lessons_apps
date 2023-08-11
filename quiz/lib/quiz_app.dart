import 'package:flutter/material.dart';
import 'package:quiz/features/home/view/home_screen.dart';
import 'package:quiz/features/questions/view/questions_screen.dart';
import 'package:quiz/features/results/view/results_screen.dart';
import 'package:quiz/repositories/questions/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String route = '/';

  void navigateTo(String path) {
    setState(() {
      route = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (route) {
      case '/':
        screen = HomeScreen(navigateTo: navigateTo);
      case '/questions':
        screen = QuestionsScreen(
          navigateTo: navigateTo,
          questions: questions,
        );
      case '/results':
        screen = ResultsScreen(
          navigateTo: navigateTo,
          questions: questions,
        );
      default:
        throw ('unhandled route');
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 241, 26, 65),
                Color.fromARGB(255, 134, 26, 241)
              ],
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
