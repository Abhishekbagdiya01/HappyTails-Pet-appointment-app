import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';
import 'package:pet_appointment_app/screens/user_dashbord.dart';
import 'package:pet_appointment_app/screens/welcome/lets_star.dart';
import 'package:pet_appointment_app/utils/shared_preference.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? accountType;
  getAccountType() async {
    accountType = await SharedPref().getAccountType();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAccountType();
    Timer(Duration(seconds: 3), () {
      if (accountType == "User") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserDashbordPage(),
            ));
      } else if (accountType == "Doctor") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDashboard(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => letsStart(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assets/images/logo.png')),
        )
      ],
    ));
  }
}
