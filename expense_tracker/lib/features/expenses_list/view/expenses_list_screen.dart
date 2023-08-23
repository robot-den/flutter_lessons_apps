import 'package:expense_tracker/features/expenses_list/widgets/widgets.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/repository/expenses/expenses.dart';
import 'package:get_it/get_it.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  final expensesRepository = GetIt.I<AbstractExpensesRepository>();

  List<Expense> expenses = [];
  Map<Category, double> totalsByCategory = {};

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpenseForm(
        createExpense: createExpense,
      ),
    );
  }

  void createExpense(expense) {
    expensesRepository.saveExpense(expense);
    setState(() {});
  }

  void removeExpense(expense) {
    final List<Expense> expenses = expensesRepository.expensesList();
    int expenseIndex = expenses.indexOf(expense);
    expensesRepository.deleteExpense(expense);
    setState(() {});

    ScaffoldMessengerState sm = ScaffoldMessenger.of(context);
    sm.clearSnackBars();
    sm.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            expensesRepository.restoreExpense(expenseIndex, expense);
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget mainContent(List<Expense> expenses) {
    if (expenses.isEmpty) {
      return const Center(
        child: Text("You don't have any expenses. Start adding some!"),
      );
    } else {
      return ExpensesList(
        expenses: expenses,
        onExpenseRemove: removeExpense,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final expenses = expensesRepository.expensesList();
    final totalsByCategory = expensesRepository.categoryTotals();
    final screenWidth = MediaQuery.of(context).size.width;

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
      body: screenWidth < 600
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chart(totalsByCategory: totalsByCategory),
                  Expanded(child: mainContent(expenses)),
                ],
              ),
            )
          : Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Chart(totalsByCategory: totalsByCategory)),
                  Expanded(child: mainContent(expenses)),
                ],
              ),
            ),
    );
  }
}
