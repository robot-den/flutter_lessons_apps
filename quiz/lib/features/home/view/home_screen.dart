import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.renderQuestionsScreen,
    super.key,
  });

  final void Function() renderQuestionsScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/images/questions-logo.png'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome to the Quiz!',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: renderQuestionsScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(width: 0.2),
            ),
            child: const Text('Start'),
          )
        ],
      ),
    );
  }
}
