import 'package:flutter/material.dart';
import 'package:intermediate_app/data/questions.dart';
import 'package:intermediate_app/questions_screen.dart';
import 'package:intermediate_app/results_screen.dart';
import 'package:intermediate_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = 'active-screen';
  //   super.initState();
  // }

  void switchScreen(String switchToScreen) {
    setState(() {
      _selectedAnswers = switchToScreen == 'questions-screen' ? [] : _selectedAnswers;
      activeScreen = switchToScreen;
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // var screenWidget = StartScreen(switchScreen);
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        restartQuiz: switchScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurple,
                Colors.purple,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget
            // child: activeScreen == 'start-screen'
            //     ? StartScreen(switchScreen)
            //     : const QuestionsScreen(),
            ),
      ),
    );
  }
}
