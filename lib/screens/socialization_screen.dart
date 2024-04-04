import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
import 'package:pet_appointment_app/widgets/custom_clip.dart';
import 'package:pet_appointment_app/widgets/custom_textfeild.dart';

class SocializationScreen extends StatefulWidget {
  const SocializationScreen({super.key});

  @override
  State<SocializationScreen> createState() => _SocializationPageState();
}

class _SocializationPageState extends State<SocializationScreen> {
  @override
  Widget build(BuildContext context) {
    List details = [
      {
        'title': 'Meetups',
        'titleOne': 'Create&Invite',
        'titleTwo': 'Participate',
      },
      {
        'title': 'Happy to Help',
        'titleOne': 'Raise a Query',
        'titleTwo': 'Answer a Query'
      },
    ];

    List boxColor = [
      Color(0xffFF9595),
      Color(0xffB533A8),
    ];

    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 200,
          flexibleSpace: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffBCF4DC),
              child: Center(
                child: Text(
                  "Socialization",
                  style: customTextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '  For your Happy life, develop a healthy community.',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,

                    //const Color(0xffD3F2EE)
                  ),
                ),
              ),
              Container(
                width: screenWidth / 1,
                height: screenHeight / 3.5,
                //color: Colors.red,
                child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth / 1,
                        height: screenHeight / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: boxColor[index],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(details[index]['title'],
                                    style: GoogleFonts.jacquesFrancois(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(details[index]['titleOne'],
                                    style: GoogleFonts.jacquesFrancois(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16)),
                                Text(details[index]['titleTwo'],
                                    style: GoogleFonts.jacquesFrancois(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: screenWidth / 1,
                child: Image.asset('assets/images/peoples.png'),
              ),
              // CustomButtom(title: ' Okay ', voidCallback: () {})
            ],
          ),
        ));
  }
}
