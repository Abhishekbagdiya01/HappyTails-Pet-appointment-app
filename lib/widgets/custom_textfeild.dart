import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({required this.title, this.myIcon, this.controller});

  String title;
  Icon? myIcon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
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
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//

customTextStyle({Color? color, FontWeight? fontWeight = FontWeight.bold}) {
  return TextStyle(color: color, fontSize: 20, fontWeight: fontWeight);
}
