import 'package:flutter/material.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_auth_repository.dart';

import 'package:pet_appointment_app/screens/doctor_home_screen.dart';
import 'package:pet_appointment_app/screens/doctor_profile_Page.dart';
import 'package:pet_appointment_app/screens/notification_screen.dart';
import 'package:pet_appointment_app/utils/shared_preference.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({Key? key}) : super(key: key);

  @override
  State<DoctorDashboard> createState() => _DoctorDeshbordState();
}

class _DoctorDeshbordState extends State<DoctorDashboard> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    DoctorHomePage(),
    Text('Message'),
    NotificationScreen(),
    DoctorProfilePageScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Icons.message,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
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
