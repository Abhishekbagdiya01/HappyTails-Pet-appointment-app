import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_appointment_app/constants.dart';
import 'package:pet_appointment_app/models/user_model.dart';
import 'package:pet_appointment_app/repository/user_repository/user_auth_repository.dart';
import 'package:pet_appointment_app/screens/auth/components/sign_up_form_user.dart';
import 'package:pet_appointment_app/screens/auth/sign_in_user_screen.dart';
import 'package:pet_appointment_app/screens/user_dashbord.dart';
import 'package:pet_appointment_app/utils/shared_preference.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
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
            // Now it takes 100% of our height
          ),
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              )),
                          child: Text(
                            "Sign In!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    Form(
                      // key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldName(text: "name"),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(hintText: "name"),
                          ),
                          const SizedBox(height: defaultPadding),
                          TextFieldName(text: "Email"),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText: "email"),
                          ),
                          const SizedBox(height: defaultPadding),
                          TextFieldName(text: "Phone"),
                          TextFormField(
                            controller: phoneNoController,
                            keyboardType: TextInputType.phone,
                            decoration:
                                InputDecoration(hintText: "phone number"),
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
                          if (nameController.text.trim().isEmpty &&
                              emailController.text.trim().isEmpty &&
                              phoneNoController.text.trim().isEmpty &&
                              passwordController.text.trim().isEmpty) {
                            snackbarMessenger(
                                context, "Field can not be empty");
                          } else {
                            String result = await UserAuthRepository()
                                .signUpUser(
                                    userModel: UserModel(
                                        uid: "",
                                        name: nameController.text,
                                        email: emailController.text,
                                        phoneNumber: phoneNoController.text,
                                        password: passwordController.text,
                                        appointments: [],
                                        doctors: [],
                                        pets: [],
                                        profileUrl: ""));
                            if (result == "Successfully Signed Up") {
                              SharedPref().setAccountType("User");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDashbordPage(),
                                  ),
                                  (route) => false);
                            }
                            snackbarMessenger(context, result);
                          }
                        },
                        child: Text(
                          "Sign Up",
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
