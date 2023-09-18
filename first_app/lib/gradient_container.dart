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

  // Here we add another parameter, the list of colors
  GradientContainer({super.key, required this.colors});

  // Another constructor, with defined colors
  GradientContainer.sunset({super.key}) : colors = [Colors.amber, Colors.red];

  // We add the final list of colors
  final List<Color> colors;

  // Variable 
  var activeDiceImage = 'assets/images/dice-2.png';
 
  void rollDice() {
    // ...
    activeDiceImage = 'assets/images/dice-4.png';
  }
  // build method automatically receive by Flutter a values of context
  // context. Object that containts useful information
  @override
  Widget build(context) {
    return Container(
      // We can't use `const` here because our list of colors, List is a type of object dynamic even if we set as final
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        // Image Widget has a default constructor function called `asset`
        child: Column(
          // We need this mainAxisSize because Column and Row takes all the available space of container Widget
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
              width: 200,
            ),
            // SizedBox it's another way to put an space between Widgets
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: rollDice,
              // We use styleFrom constructor for replace default style values of TextButton
              style: TextButton.styleFrom(
                // EdgeInsets allow to padding all or specific the padding position (top, left, right, bottom)
                // padding: const EdgeInsets.only(
                //   top: 20,
                // ),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28),
              ),
              child: const Text("Roll Dice"),
            )
          ],
        ),
      ),
    );
  }
}

/*
// Alternative approach
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
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
*/
