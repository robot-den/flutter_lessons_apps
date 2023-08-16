import 'package:expense_tracker/expense_tracker_app.dart';
import 'package:expense_tracker/repository/expenses/expenses.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<AbstractExpensesRepository>(
    LocalExpensesRepository(),
  );

  runApp(const ExpensesTrackerApp());
}
