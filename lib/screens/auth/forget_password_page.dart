import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/screens/auth/components/sign_up_form_user.dart';
import 'package:pet_appointment_app/screens/welcome/lets_star.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({
    Key? key,
  });

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Forget Password',
            style: GoogleFonts.jockeyOne(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextFieldName(text: "Email"),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "your email"),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            if (emailController.text.trim().isNotEmpty) {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: emailController.text)
                                  .then((value) {
                                snackbarMessenger(context,
                                    "Password reset link sended to your given email");

                                Timer(Duration(milliseconds: 3000), () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => letsStart(),
                                      ),
                                      (route) => false);
                                });
                              });
                            } else {
                              snackbarMessenger(
                                  context, "Email cannot be empty");
                            }
                          } on FirebaseAuthException catch (error) {
                            snackbarMessenger(
                                context, error.message.toString());
                          }
                        },
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
