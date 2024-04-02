import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/screens/adoption.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';

import '../customButton/custom_button.dart';

class VetScreen extends StatefulWidget {
  @override
  State<VetScreen> createState() => _VetScreenState();
}

class _VetScreenState extends State<VetScreen> {
  //bool _isChecked = false;
  List<bool> _checkedItems = List.generate(5, (index) => false);
  List details = [
    "Coughing",
    "Sneezing",
    "Vomiting",
    "Diarrhea",
    "Etc...     "
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Schedule an\n Appointment',
                textAlign: TextAlign.center,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please enter diet and feeding information',
                textAlign: TextAlign.center,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
            ),
            CustomTextFeild(title: 'Bread of Food'),
            CustomTextFeild(title: 'Amount of Feeding'),
            CustomTextFeild(title: 'Type of Treats'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Check the conditions that apply to your pet',
                textAlign: TextAlign.center,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                height: 220,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: _checkedItems.length,
                  itemBuilder: (context, index) {
                    return Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
                          child: Checkbox(
                            value: _checkedItems[index],
                            onChanged: (bool? newValue) {
                              setState(() {
                                _checkedItems[index] = newValue!;
                              });
                            },
                          ),
                        ),
                        Text(
                          details[index].toString(),
                          style: GoogleFonts.jacquesFrancois(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,

                            //const Color(0xffD3F2EE)
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            CustomButtom(
                title: 'Next...',
                voidCallback: () {
                  //AdoptionPage
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdoptionPage(),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
