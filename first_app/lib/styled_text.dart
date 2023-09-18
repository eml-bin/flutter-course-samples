import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(context) {
    return const Text(
      'Hey You 🌟!',
      style: TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
