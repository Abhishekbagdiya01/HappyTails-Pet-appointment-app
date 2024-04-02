import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    required this.title,
    required this.voidCallback,
  });

  String title;
  VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.sizeOf(context).width,
      height: 100,
      color: Color(0xFF9CDFEB),
      onPressed: voidCallback,
      child: Text(title,
          style: GoogleFonts.jacquesFrancois(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
