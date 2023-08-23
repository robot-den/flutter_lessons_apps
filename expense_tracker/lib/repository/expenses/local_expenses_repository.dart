import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/repository/expenses/abstract_expenses_repository.dart';

final List<Expense> _expenses = [
  Expense(
    title: 'Water in gym',
    amount: 10.6,
    date: DateTime.now(),
    category: Category.gym,
  ),
  Expense(
    title: 'Breakfast at skyscrapper',
    amount: 20.56,
    date: DateTime.now(),
    category: Category.food,
  ),
];

class LocalExpensesRepository implements AbstractExpensesRepository {
  // IMPORTANT: copying is required
  @override
  List<Expense> expensesList() => List.from(_expenses);

  @override
  bool saveExpense(Expense expense) {
    _expenses.add(expense);

    return true;
  }

  @override
  bool deleteExpense(Expense expense) {
    _expenses.remove(expense);

    return true;
  }

  @override
  bool restoreExpense(int expenseIndex, Expense expense) {
    _expenses.insert(expenseIndex, expense);

    return true;
  }

  @override
  Map<Category, double> categoryTotals() {
    Map<Category, double> totals = {};
    for (var expense in _expenses) {
      totals[expense.category] ??= 0.0;
      totals[expense.category] = totals[expense.category]! + expense.amount;
    }

    return totals;
  }
}
