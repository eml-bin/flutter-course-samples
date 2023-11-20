import 'package:flutter/material.dart';
import 'package:interactive_app/widgets/chart/chart.dart';
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
    Expense(
      title: 'Sushi',
      amount: 15.22,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Uber',
      amount: 15.22,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'McDonalds',
      amount: 15.22,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'AT&T',
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
      useSafeArea: true, // Feature makes sure that modal stay away from devices features (like front-camera) that affecting UI
      isScrollControlled:
          true, // Make this overlay take the full abailable height
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
      constraints: const BoxConstraints(maxWidth: double.infinity),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    // ScaffoldMessenger with showSnackBar, shows a info message on screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            // Execute setState again with the undo item and use insert
            // for respect the position item in list
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The build executes again if you rotate the device (Flutter does automatically)

    // Access to context meta-information (for example: Display width)
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("Not expenses created. Add one"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
      body: width < 600
          ? Column(
              // Column -> Width: 0 - Depends on children | Height: INFINITY
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              // Row -> Width: INFINITY | Height: 0 - Depends on children
              children: [
                // Expanded constraints the child to only take as much width as available
                // limits the width available not infinity
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
