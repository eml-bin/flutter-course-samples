// Way to import a package in Dart
import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

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
