import 'package:flutter/material.dart';
import 'package:interactive_app/widgets/expenses_list/expenses_list.dart';
import 'package:interactive_app/models/expense.dart';
import 'package:interactive_app/widgets/new_expense.dart';

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

  // Overlay Function
  void _openAddExpenseOverlay() {
    // Flutter has multiple built-in overlays functions (show...) from `material.dart`
    //    * In the classes that extends of State, Flutter automatically adds a global context property
    //        * context. It's a Widget <meta> data on the widget tree

    //    * The builder property normally expects a Widget builder function
    //        * ctx. It's the context for the overlay builder
    showModalBottomSheet(
      isScrollControlled: true, // Make this overlay take the full abailable height
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold Widget have this appBar property for configure a appBar (top-bar) in your app
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
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
