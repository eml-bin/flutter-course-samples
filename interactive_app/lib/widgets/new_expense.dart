import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "\$",
              label: Text("Amount"),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // Removes the overlay, the context its a necessary parameter 
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text("Save Expense"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
