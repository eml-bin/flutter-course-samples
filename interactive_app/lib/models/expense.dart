import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// intl package with a variety of date formats
final formatter = DateFormat.yMd();

// uuid outside class because it's an utility
// and maybe you can use in more classes here
const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  // The line above initialize a parameter that not receives in constructor

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // This is a getter prop
  String get formattedDate {
    return formatter.format(date);
  }
}
