import 'package:flutter/material.dart';
import 'package:interactive_app/models/expense.dart';
import 'package:interactive_app/widgets/expenses_list/expenses_item.dart';

// Use for output/render a ExpensesList
class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // ListView Widget. Scrollable List Widget
    // Using the builder constructor for a better performance for 'n' items Lists

    return ListView.builder(
      itemCount: expenses.length,
      // Dismissible Widget allows to swipe the item
      // this its a widget that uses the key unique value
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
