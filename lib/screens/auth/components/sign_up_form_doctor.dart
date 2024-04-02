import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pet_appointment_app/screens/auth/components/sign_up_form_user.dart';

import '../../../constants.dart';

class SignUpFormDoctor extends StatelessWidget {
  SignUpFormDoctor({Key? key, required this.formKeyDoctor});

  final GlobalKey formKeyDoctor;

  late String _doctorName,
      _doctorEmail,
      _degreeName,
      _specialization,
      _passwordDoctor,
      _phoneNumberDoctor; // degree , speclifation

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyDoctor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldName(text: "Doctor name"),
          TextFormField(
            decoration: InputDecoration(hintText: "theflutterway"),
            validator: RequiredValidator(errorText: "Username is required"),
            // Let's save our username
            onSaved: (doctorName) => _doctorName = doctorName!,
          ),
          TextFieldName(text: "Degree"),
          TextFormField(
            decoration: InputDecoration(hintText: "MBBS/Narsuing"),
            validator: RequiredValidator(errorText: "Degree is required"),
            // Let's save our username
            onSaved: (degreeName) => _degreeName = degreeName!,
          ),
          TextFieldName(text: "Specialization"),
          TextFormField(
            decoration: InputDecoration(hintText: "Dog/Bird"),
            validator:
                RequiredValidator(errorText: "Specialization is required"),
            // Let's save our username
            onSaved: (specialization) => _specialization = specialization!,
          ),
          const SizedBox(height: defaultPadding),
          // We will fixed the error soon
          // As you can see, it's a email field
          // But no @ on keybord
          TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (doctorEmail) => _doctorEmail = doctorEmail!,
          ),
          const SizedBox(height: defaultPadding),

          TextFieldName(text: "Phone"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "+123487697"),
            validator: RequiredValidator(errorText: "Phone number is required"),
            onSaved: (phoneNumberDoctor) =>
                _phoneNumberDoctor = phoneNumberDoctor!,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Password"),

          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (passwordDoctor) => _passwordDoctor = passwordDoctor!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (passDoctor) => _passwordDoctor = passDoctor,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(hintText: "*****"),
            validator: (passDoctor) =>
                MatchValidator(errorText: "Password do not  match")
                    .validateMatch(passDoctor!, _passwordDoctor),
          ),
        ],
      ),
    );
  }
}
