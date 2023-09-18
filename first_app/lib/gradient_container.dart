import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

// Using variables inside Widget Classes

// `var` variable because they can change   
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight; 

// GradientContainer. Widget for separate Gradient background of screen
//    * StatelessWidget. Flutter class for built a widget
class GradientContainer extends StatelessWidget {
  // StatelessWidget needs `key` parameter
  const GradientContainer({super.key});

  // build method automatically receive by Flutter a values of context
  // context. Object that containts useful information
  @override
  Widget build(context) {
    return Container(
      // We can't use `const` here because the new variables `startAlignment` `endAlignment` are not locked 
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          // Here yes, because List of Colors are the same always, are locked
          colors: [
            Color.fromARGB(255, 0, 77, 77),
            Color.fromARGB(255, 0, 89, 116),
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText('Fak 🌟!'),
      ),
    );
  }
}
