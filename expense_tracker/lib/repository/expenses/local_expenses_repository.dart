import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/repository/expenses/abstract_expenses_repository.dart';

final List<Expense> expenses = [
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
  @override
  List<Expense> expensesList() {
    return expenses;
  }
}
