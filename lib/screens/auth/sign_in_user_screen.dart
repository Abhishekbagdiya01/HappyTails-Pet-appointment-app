import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_appointment_app/repository/user_repository/user_auth_repository.dart';
import 'package:pet_appointment_app/screens/auth/components/sign_up_form_user.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';
import 'package:pet_appointment_app/screens/user_dashbord.dart';
import 'package:pet_appointment_app/utils/shared_preference.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';
import '../../constants.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldName(text: "Email"),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText: "email"),
                          ),
                          const SizedBox(height: defaultPadding),
                          TextFieldName(text: "Password"),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(hintText: "******"),
                          ),
                          const SizedBox(height: defaultPadding),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (emailController.text.trim().isNotEmpty &&
                              passwordController.text.trim().isNotEmpty) {
                            final response = await UserRepository().loginUser(
                                email: emailController.text,
                                password: passwordController.text);

                            if (response == "Successfully login") {
                              // SharedPref().setAccountType("User");
                              snackbarMessenger(context, response);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDashbordPage(),
                                  ));
                            } else {
                              snackbarMessenger(context, response);
                            }
                          } else {
                            snackbarMessenger(context, "Field cannot be empty");
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
