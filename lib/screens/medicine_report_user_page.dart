import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/widgets/custom_button.dart';

class MedicineReportUserPage extends StatefulWidget {
  //const MedicineReportUserPage({super.key});
  @override
  State<MedicineReportUserPage> createState() => _MedicineReportUserPageState();
}

class _MedicineReportUserPageState extends State<MedicineReportUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Pet Report',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                    //const Color(0xffD3F2EE)
                  ),
                ),
              ),
              Image(image: AssetImage('assets/images/people_chat.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Here is Your details ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                    //const Color(0xffD3F2EE)
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 450,
                color: Color(0xffD9D9D9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Diagnosis Detail : xyz',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black

                          //const Color(0xffD3F2EE)
                          ),
                    ),
                    Text(
                      'Prescribed medication : xyz ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black

                          //const Color(0xffD3F2EE)
                          ),
                    ),
                    Text(
                      'Types of Treats :  ?? ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black

                          //const Color(0xffD3F2EE)
                          ),
                    ),
                    Text(
                      'Dosage : pta nhii ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black

                          //const Color(0xffD3F2EE)
                          ),
                    ),
                    Text(
                      'Administration Route : ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black

                          //const Color(0xffD3F2EE)
                          ),
                    ),
                    Text(
                      'Vaccine name : ???',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black

                          //const Color(0xffD3F2EE)
                          ),
                    ),
                    Text(
                      'Date Administered : ???',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black

                          //const Color(0xffD3F2EE)
                          ),
                    )
                  ],
                ),
              ),

              /*
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your details here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                      BorderSide(color: Color(0xffD9D9D9)), // Border color
                    ),
                    filled: true,
                    fillColor: Color(0xffD3F2EE), // Background color
                  ),
        
                  maxLines: 15, // Set maxLines to restrict the number of lines
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                    // Limit total characters
                    // Add additional formatters if needed
                  ],
                ),
              ),*/
              Padding(
                padding: EdgeInsets.only(
                    right: 8.0, left: 8.0, bottom: 8.0, top: 16.0),
                child: CustomButtom(title: 'Okay', voidCallback: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
