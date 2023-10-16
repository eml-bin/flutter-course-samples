import 'package:uuid/uuid.dart';

// uuid outside class because it's an utility 
// and maybe you can use in more classes here
const uuid = Uuid();

enum Category {
  food, travel, leisure, work
}


class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();
  // The line above initialize a parameter that not receives in constructor

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

}
