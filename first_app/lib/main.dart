// Way to import a package in Dart
import 'package:flutter/material.dart';

// Main function. Entrypoint of Dart App
void main() {
  // runApp it's a principal function of Flutter Framework
  // In Flutter you build your UI with componentes called "Widgets"
  // [Flutter Widgets](https://docs.flutter.dev/ui/widgets)

  // MaterialApp. Core Widget, used as starting point for build a Flutter App

  // argument home: Display something on the screen

  // using const optmitize runtime performance
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(),
      ),
    ),
  );
}

// GradientContainer. Widget for separate Gradient background of screen
//    * StatelessWidget. Flutter class for built a widget
class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  // build method automatically receive by Flutter a values of context
  // context. Object that containts useful information
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 77, 77),
            Color.fromARGB(255, 0, 89, 116),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Text(
          'Hallo Wald!',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}
