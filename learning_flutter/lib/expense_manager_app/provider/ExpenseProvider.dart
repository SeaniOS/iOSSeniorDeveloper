import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  // with ChangeNotifier

  final LocalStorage storage; // using LocalStorage

  List<Expense> _expenses = [];

  List<Expense> get expenses =>
      _expenses; // A getter to access the list of expenses.

  ExpenseProvider(this.storage) {
    _loadExpensesFromStorage();
  }

  void _loadExpensesFromStorage() async {
    // await storage.ready;
    /*final LocalStorage storage = LocalStorage('my_app');
    await storage.setItem('token', 'abc');
    final token = storage.getItem('token');*/

    var storedExpenses = storage.getItem('expenses');
    if (storedExpenses != null) {
      _expenses = List<Expense>.from(
        (storedExpenses as List).map((item) => Expense.fromJson(item)),
        // suppose that `item` is json and `storedExpenses` is json list
      );
      notifyListeners();
    }
  }

  void _saveExpensesToStorage() {
    final storedExpenses = _expenses.map((e) => e.toJson()).toList();
    storage.setItem('expenses', storedExpenses.toString());
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    _saveExpensesToStorage();
    notifyListeners();
  }

  void addOrUpdateExpense(Expense expense) {
    int index = _expenses.indexWhere((e) => e.id == expense.id);
    if (index != -1) {
      _expenses[index] = expense;
    } else {
      _expenses.add(expense);
    }
    _saveExpensesToStorage();
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    _saveExpensesToStorage();
    notifyListeners();
  }
}
