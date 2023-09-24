# intermediate_app: Quiz App 📝

New knowledges about Flutter

# init

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
    
# StartScreen

###`<main.dart>`
* Wrap StartScreen in Container Widget (VScode Refactor 💡)

* Use decoration argument of Container and add BoxDecoration Widget for add a gradient background to StartScreen Widget

###`<start_screen.dart>`
* Wrap <Text> Widget with a <Center> Widget, <Center> Widget will try to get as much space as it can for full the entire screen

* Change <Text> Widget to <Column> Widget for organize child Widget's vertically
    * Use children argument for next Widgets...

###`<pubspec.yaml>`
* Set up assets for Flutter project
    `assets:`



