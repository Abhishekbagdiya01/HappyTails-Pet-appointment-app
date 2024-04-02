import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';
import 'package:table_calendar/table_calendar.dart';

class AdoptionPage extends StatefulWidget {
  //AdoptionPage({super.key});

  @override
  State<AdoptionPage> createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Adopt a Pet',
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
            child: Image(image: AssetImage('assets/images/dog.png')),
          ),
          CustomTextFeild(title: 'Enter Owner Name'),
          CustomTextFeild(title: 'Mobile Number'),
          CustomTextFeild(title: 'Enter  Pet Name'),
          CustomTextFeild(title: 'Enter Breed Name'),
          SizedBox(
            height: 100,
          ),
          CustomButtom(
              title: 'Next...',
              voidCallback: () {
                //ScheduleDate
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleDate(),
                    ));
              })
        ],
      ),
    );
  }
}

class ScheduleDate extends StatefulWidget {
  //ScheduleDate({});

  @override
  State<ScheduleDate> createState() => _ScheduleDateState();
}

class _ScheduleDateState extends State<ScheduleDate> {
  String _selectedItem = 'Doctor Speciality';

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ' Schedule an\n Appointment',
              textAlign: TextAlign.center,
              style: GoogleFonts.jacquesFrancois(
                fontSize: 24,
                fontWeight: FontWeight.bold,

                //const Color(0xffD3F2EE)
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Please enter Consult information',
              textAlign: TextAlign.start,
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
              width: double.infinity,
              height: 50,
              color: Color(0xffD3F2EE),
              child: Center(
                child: DropdownButton<String>(
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                  items: <String>[
                    'Doctor Speciality',
                    'Option 2',
                    'Option 3',
                    'Option 4'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Specify Time and Date of Appoiment',
              textAlign: TextAlign.start,
              style: GoogleFonts.jacquesFrancois(
                fontSize: 14,
                fontWeight: FontWeight.bold,

                //const Color(0xffD3F2EE)
              ),
            ),
          ),
          CustomTextFeild(
            title: 'Time of Consultion',
            myIcon: Icon(Icons.timer_outlined),
          ),
          Container(
            width: 300,
            height: 400,
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              focusedDay: today,
              lastDay: DateTime.utc(2030, 3, 14),
            ),
          ),
          CustomButtom(
              title: 'Schedule',
              voidCallback: () {
                //ScheduledPage
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduledPage(),
                    ));
              })
        ],
      ),
    );
  }
}

class ScheduledPage extends StatefulWidget {
  //const ScheduledPage({super.key});

  @override
  State<ScheduledPage> createState() => _ScheduledPageState();
}

class _ScheduledPageState extends State<ScheduledPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' Appointment \n Scheduled!',
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
                ' Here is Your details ',
                textAlign: TextAlign.center,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
            ),
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
            ),
            //CustomTextFeild(title: 'title'),
            /*

             TextField(
        decoration: InputDecoration(
          hintText: title,
          suffixIcon: myIcon,
          hintStyle: TextStyle(color: Colors.grey),
          // Hint text color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue), // Border color
          ),
          filled: true,
          fillColor: Color(0xffD3F2EE), // Background color
        ),
        // style: TextStyle(color: Colors.black), // Text color
        style: GoogleFonts.jacquesFrancois(
          color: Color(0xffD3F2EE),
          fontWeight: FontWeight.bold,
        ),
      ),



             */
            /*
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                height: 450,
                color: Colors.red,
                child: CustomTextFeild(
                  title: '',
                ),
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
    );
  }
}
