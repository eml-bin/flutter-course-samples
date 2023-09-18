import 'dart:math';

import 'package:flutter/material.dart';

/*
// StaefulWidget. Allows to manage a state (data)
      - data that may change over time and that should impact the rendered UI
*/
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  // State its a generic type so we need the brackets < >
  // infom to Dart whick king of state will be managed here
  State<DiceRoller> createState() {
    // createState its a necessary constructor for a StatefulWidget
    return _DiceRollState();
  }
}

// the underscore has a special meaning in Dart, indicate that this class is private
class _DiceRollState extends State<DiceRoller> {
  // dynamic Variable
  var currentDiceRoll = 1;

  void rollDice() {
    // you need execute setState StatefulWidget function for changes reflected on UI 
    setState(() { 
      currentDiceRoll = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      // We need this mainAxisSize because Column and Row takes all the available space of container Widget
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          // dynamic concatenation of strings with variables
          'assets/images/dice-$currentDiceRoll.png',
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
    );
  }
}
