import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:pet_appointment_app/repository/appointment_repository.dart';
import 'package:pet_appointment_app/screens/doctor_home_screen.dart';
import 'package:pet_appointment_app/screens/vet_Screen.dart';

class DoctorDashboard extends StatefulWidget {
  DoctorDashboard({Key? key}) : super(key: key);

  @override
  State<DoctorDashboard> createState() => _DoctorDesbordState();
}

class _DoctorDesbordState extends State<DoctorDashboard> {
  int _selectedIndex = 0;
  String? accountType;
  List<AppointmentModel>? listOfRequestedAppointments;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      DoctorHomePage(),
      DoctorHomePage(),
      DoctorHomePage(),
      DoctorHomePage(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class ScheduleAppointmentPage extends StatefulWidget {
  const ScheduleAppointmentPage({Key? key}) : super(key: key);

  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  String _selectedItem = 'Option 1';
  String _selectedItemm = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Schedule an\n Appointment',
              textAlign: TextAlign.center,
              style: GoogleFonts.jacquesFrancois(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image(image: AssetImage('assets/images/undraw_select.png')),
            Text(
              'Tell us about your pet',
              textAlign: TextAlign.center,
              style: GoogleFonts.jacquesFrancois(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextFeild(title: 'Enter  Pet Name'),
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
                      'Option 1',
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Color(0xffD3F2EE),
                child: Center(
                  child: DropdownButton<String>(
                    value: _selectedItemm,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItemm = newValue!;
                      });
                    },
                    items: <String>[
                      'Option 1',
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
            CustomTextFeild(
              title: 'Enter Breed Name',
            ),
            CustomTextFeild(
              title: 'Age ',
              myIcon: Icon(Icons.calendar_month),
            ),
            CustomButtom(
                title: 'Next...',
                voidCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VetScreen(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    required this.title,
    this.myIcon,
  });

  String title;
  Icon? myIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
    );
  }
}
