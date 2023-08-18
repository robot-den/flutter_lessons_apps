import 'package:expense_tracker/features/expenses_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/repository/expenses/expenses.dart';
import 'package:get_it/get_it.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpenseForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenses = GetIt.I<AbstractExpensesRepository>().expensesList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            iconSize: 36,
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add_box),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('chart'),
            Expanded(
              child: ExpensesList(expenses: expenses),
            ),
          ],
        ),
      ),
    );
  }
}
