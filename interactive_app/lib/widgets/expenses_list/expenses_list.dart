import 'package:flutter/material.dart';
import 'package:interactive_app/models/expense.dart';
import 'package:interactive_app/widgets/expenses_list/expenses_item.dart';

// Use for output/render a ExpensesList
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // ListView Widget. Scrollable List Widget
    // Using the builder constructor for a better performance for 'n' items Lists

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}
