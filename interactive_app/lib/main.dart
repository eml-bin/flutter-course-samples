import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:interactive_app/widgets/expenses.dart';

// Start with `k` its just a convention
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // LOCK PREFERRED APP ORIENTATION

  // Make sure that locking the orientation and then running app
  // WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  //   // Once the preferred orientation have been locked in

  //   runApp(
  //     MaterialApp(
  //       // Theme property in Material App
  //       // Allows to set a global configuration style for multiple Widgets
  //       //  * colors
  //       //  * subthemes
  //       //  * etc
  //       darkTheme: ThemeData.dark().copyWith(
  //         useMaterial3: true,
  //         colorScheme: kDarkColorScheme,
  //         cardTheme: const CardTheme().copyWith(
  //           color: kDarkColorScheme.secondaryContainer,
  //           margin: const EdgeInsets.symmetric(
  //             horizontal: 16,
  //             vertical: 6,
  //           ),
  //         ),
  //         elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //               backgroundColor: kDarkColorScheme.primaryContainer,
  //               foregroundColor: kDarkColorScheme.onPrimaryContainer),
  //         ),
  //       ),
  //       theme: ThemeData().copyWith(
  //         // copyWith method, get some default theme settings
  //         useMaterial3: true,
  //         colorScheme: kColorScheme, // Define some colors (palette)
  //         appBarTheme: const AppBarTheme().copyWith(
  //           backgroundColor: kColorScheme.onPrimaryContainer,
  //           foregroundColor: kColorScheme.primaryContainer,
  //         ),
  //         cardTheme: const CardTheme().copyWith(
  //           color: kColorScheme.secondaryContainer,
  //           margin: const EdgeInsets.symmetric(
  //             horizontal: 16,
  //             vertical: 6,
  //           ),
  //         ),
  //         elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: kColorScheme.primaryContainer,
  //           ),
  //         ),
  //         textTheme: ThemeData().textTheme.copyWith(
  //               titleLarge: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: kColorScheme.onSecondaryContainer,
  //                 fontSize: 14,
  //               ),
  //             ),
  //       ),

  //       // themeMode: ThemeMode.system, // default value is system
  //       home: const Expenses(),
  //     ),
  //   );
  // });

  runApp(
    MaterialApp(
      // Theme property in Material App
      // Allows to set a global configuration style for multiple Widgets
      //  * colors
      //  * subthemes
      //  * etc
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        // copyWith method, get some default theme settings
        useMaterial3: true,
        colorScheme: kColorScheme, // Define some colors (palette)
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),

      // themeMode: ThemeMode.system, // default value is system
      home: const Expenses(),
    ),
  );
}
