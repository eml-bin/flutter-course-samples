# intermediate_app: Quiz App 📝

New knowledges about Flutter

## Objectives
    - Reuse past knowledge with Flutter & Dart
    - Render content conditionally (Navigation)

# LogBook

### Init

* We started with an empty main.dart file
    * Write main() <function> (entrypoint)
    * Then call runApp() inside main() to call a root UI Widget
        * runApp() its a function of library flutter/material.dart
    * Tipically we pass to runApp(MaterialApp) the Widget <MaterialApp>, Widget for "Configuration"
        * MaterialApp its a Widget of library flutter/material.dart
    
    * <In this case> we pass to MaterialApp an argument called `home`, home its like the first Widget "parent" of children Widgets
        * We pass the value of Scaffold, Basic Layout Widget 

    * Inside <Scaffold> Widget we pass body argument, body its my first Widget that appears in my mobile screen and is used to organize more Widgets  

* We create new dart file (start_screen.dart)
    * Inside write class StartScreen and this class its extends with StatelessWidget 
        (because in this widget we dont need a state (data) that changes dynamically)

    * Inside class write build() method with @override decorator

    * And write simplificated constructor method:
        const StartScreen({super.key});
    
### StartScreen

#### `<main.dart>`
* Wrap StartScreen in Container Widget (VScode Refactor 💡)

* Use decoration argument of Container and add BoxDecoration Widget for add a gradient background to StartScreen Widget

#### `<start_screen.dart>`
* Wrap <Text> Widget with a <Center> Widget, <Center> Widget will try to get as much space as it can for full the entire screen

* Change <Text> Widget to <Column> Widget for organize child Widget's vertically
    * Use children argument for next Widgets...

#### `<pubspec.yaml>`
* Set up assets for Flutter project
    `assets:`

#### `<start_screen.dart>`

* Add Icon to OutlineedButton Widget "Start"
* Use the OutlinedButton constructor .icon()
    - change argument `child` to `label`
    - use argument `icon` with Icon Widget of Flutter
        * Flutter gives the Icons class with some predefined icons

* Work with opacity on Images for UI layout
* Add color argumento to Image Widget 
    * The best way for work with opacity is if you have color argument in Widget its possible to use a Color with opacity

### Quiz Widget

#### `<quiz.dart>`

* Create class <Quiz> extends StatefulWidget
* Create private class <_QuizState> extends State<Quiz> 
    * Quiz & _QuizState are connected with the brackets of State<>

* Inside <_QuizState> override build() method and return the MaterialApp Widget of main.dart file
* Inside <Quiz> override createState() method and connect to <_QuizState>
* Add basic constructor to <Quiz>

### QuestionsScreen Widget

#### `<questions_screen.dart>`

* Create a basic StatefulWidget called QuestionsScreen...

### Render Conditionally (Simple Navigation)

#### `<quiz.dart>`

* Create a variable type Widget `activeScreen`, set the value of StartScreen() Widget
* Create startQuizHandler() method, and inside use setState() method to change `activeScreen` value to QuestionScreen()

### Lifting up state for navigation

With the separation of StartScreen and QuestionsScreen adding a "shared parent Widget" called Quiz, Quiz it's a Widget responsable of state and state manipulation (StatefulWidget) used to render MaterialApp and a child called "activeScreen" this implementation it's a way to use as simple navigation between screens

#### `<quiz.dart>`

* Pass the function `switchScreen()` as new argument to StartScreen inside variable `activeScreen` 

#### `<start_screen.dart>`

* Add new argument in constructor, the argument it's a `void Function()` argument 
    - `void` because the fun not return nothing
    - `Function` it's a type of Dart
    - `()` because `startQuizHandler()` not receive any argument
* Optimize the new argument with a final variable
```
const StartScreen(this.startQuizHandler, {super.key});
final void Function() startQuizHandler;
```

* Use this new final variable in argument onPressed of OutlinedButton Widget 

#### `<quiz.dart>`

* Add `initState()` method because this implementation `Widget activeScreen = const StartScreen(switchScreen);` needs a correction
* initState(). Can be used for general initialization work
* Define the variable `activeScreen` -> `Widger? activeScreen;` 
    - ? . tells Dart that variable may contain a Widger OR null

❗❗❗
#### Flutter's (Stateful) Widget Lifecycle

* The widget has a built-in lifecycle, represent with methods that automatically executed by Flutter:
    - initState(). Executed when Stateful Widget object is initialized 
    - build(). Executed when Widget is built for the first time AND after `setState()` was called
    - dispose(). Executed right before the Widget will be deleted

#### `<quiz.dart>` Ternary expression as alternative to Switch Screens without initState()

* Change `activeScreen` to var that retain a `string`
* Comment `initState()` method
* Update `switchScreen` function with new value to `activeScreen = 'questions-screen'`
* Use conditional render in argument `child` in `Container` Widget
```
child: activeScreen == 'start-screen'
    ? StartScreen(switchScreen)
    : const QuestionsScreen(),
``` 
 
#### `<quiz.dart>` Alternative to improve ternary expression with build() if

* Add a new variable inside build() method
```
Widget screenWidget = StartScreen(switchScreen);

if (activeScreen == 'questions-screen') {
    screenWidget = const QuestionsScreen();
}
```

### QuestionsScreen

* We need a new data structue that help us to manage Question and Answers (blueprints)
* Create new folder 📂 called `models` inside `📂 lib`
* Create new file `models/quiz_question.dart`
* Create new folder 📂 called `data` inside `📂 lib`
* Create new file `data/quiz_question.dart`
* Create new file `data/question.dart`


#### `<quiz_question.dart>`

* Use this file for manage questions and answers as a data structure


#### `<data.dart>`

* Use this file for questions memory data

#### `<questions_screen.dart>`

* Implement correct UI layout to QuestionsScreen

* Alternative to wrap <Column> with <Center>:
    - Wrap <Column> with <SizedBox>
    - Add widht argument to <SizedBox>:
        - `width: double.infinity` - That simply means 'use as much width as you can' 
