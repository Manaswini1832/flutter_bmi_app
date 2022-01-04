import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';
// import "util.dart";

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //IMPORTANT : Second way. This builds on top of the already present dark theme so it requires lesser no of lines of code
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0xff0A0E21),
        ),
      ),
      //Commented since home is not required if initialRoute is specified
      // home: InputPage(),

      initialRoute: "/",
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage('', '', '')
      },

      //IMPORTANT : First way of doing it
      //If you choose this way, uncomment the util.dart import
      // theme: ThemeData(
      //   primarySwatch: createMaterialColor(Color(0xff0A0E21)),
      //   scaffoldBackgroundColor: createMaterialColor(Color(0xff0A0E21)),
      //   textTheme: const TextTheme(
      //     bodyText2: TextStyle(color: Colors.white),
      //   ),
      // ),
    );
  }
}
