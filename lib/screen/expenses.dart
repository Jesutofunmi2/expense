import 'package:expense_tracker/screen/expense_list.dart';
import 'package:expense_tracker/screen/new_expense.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpense = [
    Expense(
        date: DateTime.now(),
        title: 'Flutter Course',
        amount: 3500,
        category: Category.food),
    Expense(
        date: DateTime.now(),
        title: 'Flutter Course',
        amount: 3500,
        category: Category.leisure),
    Expense(
        date: DateTime.now(),
        title: 'Flutter Course',
        amount: 3500,
        category: Category.travel),
    Expense(
        date: DateTime.now(),
        title: 'Flutter Course',
        amount: 3500,
        category: Category.work),
    Expense(
        date: DateTime.now(),
        title: 'Flutter Course',
        amount: 3500,
        category: Category.food),
  ];

  void _showModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {

    final expenseIndex = _registerExpense.indexOf(expense);
    setState(() {
      _registerExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(

       SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("deleted"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No available content"),
    );

    if (_registerExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpense,
        onRemoved: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _showModal,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [const Text("chart"), Expanded(child: mainContent)],
      ),
    );
  }
}
