import 'package:expense_tracker/features/expenses_list/widgets/widgets.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseRemove,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onExpenseRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) => onExpenseRemove(expenses[index]),
        background: Container(
          color: const Color.fromARGB(30, 255, 17, 0),
          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 6,
          ),
        ),
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
