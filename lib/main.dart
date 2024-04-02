import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_appointment_app/firebase_options.dart';
import 'package:pet_appointment_app/screens/welcome/lets_star.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Healthcare - Doctor Consultation App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: primaryColor,
          textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.all(defaultPadding),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: textFieldBorder,
            enabledBorder: textFieldBorder,
            focusedBorder: textFieldBorder,
          ),
        ),
        home: letsStart());
  }
}
