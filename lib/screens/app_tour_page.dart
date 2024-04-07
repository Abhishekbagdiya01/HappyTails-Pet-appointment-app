import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/screens/welcome/lets_star.dart';

class AppTourPage extends StatefulWidget {
//  const AppTourPage({super.key});

  @override
  State<AppTourPage> createState() => _TourPageState();
}

class _TourPageState extends State<AppTourPage> {
  List contantDetails = [
    {
      'img': 'assets/images/page.png',
      'title': 'Bonding',
      'desc':
          '"With HappyTails we learned to enjoy and relax while outside, with other dogs and friends"'
    },
    {
      'img': 'assets/images/page.png',
      'title': 'Well-behaved dog',
      'desc':
          '“Incorporating the exercises found on HappyTails helps strengthen your bond with your pet & ensure continued learning success”'
    },
    {
      'img': 'assets/images/page.png',
      'title': 'Socializing',
      'desc':
          '"Connect, engage, and create lasting bonds. Welcome to Socializing, where every connection is a step toward a vibrant community."'
    },
    {
      'img': 'assets/images/page.png',
      'title': 'Training',
      'desc':
          "Unlock Your Pet's Potential with Tailored Training Solutions on HappyTails"
    },
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              contantDetails[index]['img'],
            ),
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Positioned(
            right: screenWidth / 20,
            top: screenHeight / 1.9,
            child: Container(
              width: screenWidth / 1.2,
              height: screenHeight / 5,
              child: Text(
                contantDetails[index]['title'],
                textAlign: TextAlign.center,
                style: GoogleFonts.jockeyOne(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            right: screenWidth / 20,
            top: screenHeight / 1.4,
            child: Container(
              width: screenWidth / 1.2,
              height: screenHeight / 1,
              child: Text(
                contantDetails[index]['desc'],
                textAlign: TextAlign.center,
                style: GoogleFonts.jockeyOne(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          /*   style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),*/
          Positioned(
              right: screenWidth / 1.15,
              top: screenHeight / 1.1,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => letsStart(),
                      ));
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.jockeyOne(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Positioned(
              left: screenWidth / 1.30,
              top: screenHeight / 1.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9CDFEB)),
                onPressed: () {
                  print(index);

                  if (index == 3) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => letsStart(),
                        ));
                  } else {
                    index++;
                  }

                  setState(() {});
                },
                child: Text(
                  ' Next...',
                  style: GoogleFonts.jockeyOne(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
