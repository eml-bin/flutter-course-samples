import 'package:flutter/material.dart';

import 'package:interactive_app/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      // You can use a theme property in Material App
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
