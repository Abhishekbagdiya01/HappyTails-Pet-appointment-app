import 'package:flutter/material.dart';
import 'package:pet_appointment_app/screens/notification_screen.dart';

import 'package:pet_appointment_app/screens/user_home_screen.dart';
import 'package:pet_appointment_app/screens/user_profile_page.dart';

class UserDashbordPage extends StatefulWidget {
  const UserDashbordPage({super.key});

  @override
  State<UserDashbordPage> createState() => _UserDashbordPageState();
}

class _UserDashbordPageState extends State<UserDashbordPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    UserHomeScreen(),
    Text("messages"),
    NotificationScreen(),
    UserProfilePageScreen()
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
