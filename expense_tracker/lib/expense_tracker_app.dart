import 'package:expense_tracker/features/expenses_list/view/expenses_list_screen.dart';
import 'package:expense_tracker/theme/theme.dart';
import 'package:flutter/material.dart';

class ExpensesTrackerApp extends StatelessWidget {
  const ExpensesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker App',
      theme: mainTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const ExpensesListScreen(),
    );
  }
}
