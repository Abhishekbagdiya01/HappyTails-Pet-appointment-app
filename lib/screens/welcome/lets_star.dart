import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
import 'package:pet_appointment_app/screens/auth/sign_in_user_screen.dart';
import 'package:pet_appointment_app/screens/auth/sign_up_user_screen.dart';
import 'package:pet_appointment_app/screens/auth/sing_up_doctor_screen_.dart';

class letsStart extends StatefulWidget {
  letsStart({super.key});

  @override
  State<letsStart> createState() => _letsStartState();
}

class _letsStartState extends State<letsStart> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CustomShape(),
            SizedBox(
              width: screenWidth / 1,
              height: screenHeight / 3,
            ),
            Center(
                child: Image(
              image: AssetImage('assets/images/undraw_select.png'),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('\nHappyTials',
                  style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Text(' Caring for Pets, Creating Happy',
                style: GoogleFonts.jacquesFrancois()),
            Text('Memories', style: GoogleFonts.jacquesFrancois()),
            SizedBox(
              height: screenHeight / 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignInScreen();
                  }));
                },
                child: Text("Login")),
            CustomButtom(
              title: "Register as User",
              voidCallback: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }));
              },
            ),

            SizedBox(
              height: screenHeight / 100,
            ),

            CustomButtom(
              title: "Register as Doctor",
              voidCallback: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreenDoctor();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
