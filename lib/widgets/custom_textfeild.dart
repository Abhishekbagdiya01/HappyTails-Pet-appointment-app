import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
