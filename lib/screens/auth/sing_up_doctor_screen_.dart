import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_auth_repository.dart';
import 'package:pet_appointment_app/screens/auth/components/sign_up_form_doctor.dart';
import 'package:pet_appointment_app/screens/auth/components/sign_up_form_user.dart';
import 'package:pet_appointment_app/screens/auth/sign_in_doctor_screen.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';
import 'package:pet_appointment_app/utils/shared_preference.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';

import '../../constants.dart';

class SignUpScreenDoctor extends StatelessWidget {
  //SignUpScreenDoctor({super.key});
  // final _formKeyDoctor = GlobalKey<FormState>();
  late String _doctorName,
      _doctorEmail,
      _degreeName,
      _specialization,
      _passwordDoctor,
      _phoneNumberDoctor; //
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController doctorEmailController = TextEditingController();
  TextEditingController doctorDegreeController = TextEditingController();
  TextEditingController doctorSpecializationController =
      TextEditingController();
  TextEditingController doctorPhoneNumberController = TextEditingController();
  TextEditingController doctorPasswordController = TextEditingController();
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
                      "Create Doctor Account",
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
                                  builder: (context) =>
                                      SignInScreenDoctor() //SignInScreen(),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldName(text: "Doctor name"),
                          TextFormField(
                            controller: doctorNameController,
                            decoration: InputDecoration(hintText: "name"),
                          ),
                          TextFieldName(text: "Degree"),
                          TextFormField(
                            controller: doctorDegreeController,
                            decoration:
                                InputDecoration(hintText: "MBBS/Narsuing"),
                          ),
                          TextFieldName(text: "Specialization"),
                          TextFormField(
                            controller: doctorSpecializationController,
                            decoration: InputDecoration(hintText: "Dog/Bird"),
                          ),
                          const SizedBox(height: defaultPadding),
                          TextFieldName(text: "Email"),
                          TextFormField(
                            controller: doctorEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                                InputDecoration(hintText: "test@email.com"),
                          ),
                          const SizedBox(height: defaultPadding),
                          TextFieldName(text: "Phone"),
                          TextFormField(
                            controller: doctorPhoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(hintText: "+123487697"),
                          ),
                          const SizedBox(height: defaultPadding),
                          TextFieldName(text: "Password"),
                          TextFormField(
                            controller: doctorPasswordController,
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
                          if (doctorNameController.text.trim().isEmpty &&
                              doctorEmailController.text.trim().isEmpty &&
                              doctorDegreeController.text.trim().isEmpty &&
                              doctorSpecializationController.text
                                  .trim()
                                  .isEmpty &&
                              doctorPhoneNumberController.text.trim().isEmpty &&
                              doctorPasswordController.text.trim().isEmpty) {
                            snackbarMessenger(
                                context, "Field can not be empty");
                          } else {
                            String result = await DoctorAuthRepository()
                                .signUpDoctor(
                                    doctorModel: DoctorModel(
                                        uid: "",
                                        name: doctorNameController.text,
                                        email: doctorEmailController.text,
                                        degree: doctorDegreeController.text,
                                        imageUrl: "",
                                        specialization:
                                            doctorSpecializationController.text,
                                        phoneNumber:
                                            doctorPhoneNumberController.text,
                                        password:
                                            doctorPasswordController.text));
                            if (result == "Successfully Signed Up") {
                              SharedPref().setAccountType("Doctor");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoctorDashboard(),
                                  ),
                                  (route) => false);
                            }
                            snackbarMessenger(context, result);
                          }
                        },
                        child: Text("Sign Up"),
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
