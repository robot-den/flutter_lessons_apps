import 'package:expense_tracker/models/expense.dart';

abstract class AbstractExpensesRepository {
  List<Expense> expensesList();
  bool saveExpense(Expense expense);
  bool deleteExpense(Expense expense);
  bool restoreExpense(int expenseIndex, Expense expense);
  Map<Category, double> categoryTotals();
}
