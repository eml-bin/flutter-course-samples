# intermediate_app

New knowledges about Flutter

# init

* We started with an empty main.dart file
    * Write main() <function> (entrypoint)
    * Then call runApp() inside main() to call a root UI Widget
        * runApp() its a function of library flutter/material.dart
    * Tipically we pass to runApp(MaterialApp) the Widget <MaterialApp>, Widget "Configuration Container"
        * MaterialApp its a Widget of library flutter/material.dart
    
    * <In this case> we pass to MaterialApp an argument called `home`, home its like the first Widget "Container" of more Widgets
        * We pass the value of Scaffold, Basic Layout Widget 

    * Inside <Scaffold> Widget we pass body argument, body its my first Widget that appears in my mobile screen   

* We create new dart file (start_screen.dart)
    * Inside write class StartScreen and this class its extends with StatelessWidget 
        (because in this widget we dont need a state (data) that changes dynamically)

    * Inside class write build() method with @override decorator

    * And write simplificated constructor method:
        const StartScreen({super.key});
    

