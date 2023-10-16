import 'package:flutter/material.dart';
import 'package:interactive_app/widgets/expenses_list/exprenses_list.dart';
import 'package:interactive_app/models/Expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 23.23,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Sushi',
      amount: 15.22,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
