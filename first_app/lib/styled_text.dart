import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  // Adding text parameter type String
  // With instruction this.text, automatically initialize variable class called `text`
  /* 
    With final we can add const to optimize to guaranteed 
    that this always be the same object once it has been initialized
    */
  const StyledText(this.text, {super.key});

  // With `final` we indicate that this will only be set once, and will not be changed thereafter
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
