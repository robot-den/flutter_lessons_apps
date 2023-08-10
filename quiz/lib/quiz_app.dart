import 'package:flutter/material.dart';
import 'package:quiz/features/home/view/home_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                  ]),
            ),
            child: const HomeScreen()),
      ),
    );
  }
}
