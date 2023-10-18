import 'package:flutter/material.dart';
import 'package:interactive_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // Flutter way to manage handling user inputs
  //    * It's important to know that if you are using a Controller like this
  //      you also have to create a way to delete that Controller
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  // Dispose it's a lifecycle State Widget event, occurs when the widget removed from UI
  // * Only <State> classes can implement dispose event
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  /*
  One way to manage manual inputs (user inputs)

  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   // In this case NOT use setState because in reality we dont update anything about UI
  //   _enteredTitle = inputValue;
  // }
  */

  // Function to show date picker overlay and set de date user-input value
  void _presentDaterPicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    // showDatePicker uses <Future> objects, that is like a Promise
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    // Try to parse amount valueController to double
    final enteredAmount = double.tryParse(_amountController.text);

    // Validate if amount-value is valid after parse
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    // Validate if some value its incorrect
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please make sure a valid title, amount, and category was entered"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("OK"),
            )
          ],
        ),
      );

      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16), // Select padding of all directions 
      child: Column(
        children: [
          TextField(
            // controller is used when you manage inputs with controllers
            controller: _titleController,

            // onChanged is used when you manage inputs with variables
            // onChanged: _saveTitleInput,
            maxLength: 50,
            // keyboardType it's like the input type
            // keyboardType: TextInputType.text,

            // decoration property allows you to add like
            // a input title for example
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$",
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // _selectedDate!, the exclamation mark "!" assumes that value never be null
                    Text(
                      _selectedDate == null
                          ? "No date selected"
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDaterPicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              // DropdownButton.
              //    * onChanged use a dynamic value inside function (it's the selected value of list)
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      // DropdownMenuItem. Necessary to fill a DropdownButton
                      (category) => DropdownMenuItem(
                        value: category, // Value of DropdownMenuItem
                        child: Text(
                          // Widget to render (UI)
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(), // Map transformed to List, required by DropdownButton
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Removes the overlay, the context its a necessary parameter
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expense"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
