import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pet_appointment_app/screens/auth/components/sign_up_form_user.dart';

import '../../../constants.dart';

class SignInFormDoctor extends StatelessWidget {
  SignInFormDoctor({Key? key, required this.formKeyDoctor});

  final GlobalKey formKeyDoctor;

  late String _emailDoctor, _passwordDoctor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyDoctor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (emailDoctor) => _emailDoctor = emailDoctor!,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldName(text: "Password"),
          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (passwordDoctor) => _passwordDoctor = passwordDoctor!,
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
