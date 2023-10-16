import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuizHandler, {super.key});

  final void Function(String newScreen) startQuizHandler;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromRGBO(200, 200, 200, 0.5),
        ),
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        const SizedBox(
          height: 70,
        ),
        Text(
          'Flutter Quiz!',
          style: GoogleFonts.jetBrainsMono(
            color: Colors.white,
            fontSize: 30
          )
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: () { startQuizHandler("questions-screen"); },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start'),
            icon: const Icon(Icons.arrow_right_alt))
      ]),
    );
  }
}
