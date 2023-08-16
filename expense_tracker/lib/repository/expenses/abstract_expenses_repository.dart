import 'package:expense_tracker/models/expense.dart';

abstract class AbstractExpensesRepository {
  List<Expense> expensesList();
}
