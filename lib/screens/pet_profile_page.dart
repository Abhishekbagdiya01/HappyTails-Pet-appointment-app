import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/repository/pet_repository.dart';

import 'package:pet_appointment_app/screens/veterinary_screen.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';
import 'package:pet_appointment_app/widgets/custom_textfeild.dart';

import '../customButton/custom_button.dart';

class PetProfilePage extends StatefulWidget {
  const PetProfilePage({super.key});

  @override
  State<PetProfilePage> createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage> {
  String _selectedGender = 'Male';
  String _selectedCategory = 'Dog';
  TextEditingController nameController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet Profile',
          textAlign: TextAlign.center,
          style: GoogleFonts.jacquesFrancois(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/undraw_select.png')),
            Text(
              'Tell us about your pet',
              textAlign: TextAlign.center,
              style: GoogleFonts.jacquesFrancois(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextFeild(
              title: 'Enter  Pet Name',
              controller: nameController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Color(0xffD3F2EE),
                child: Center(
                  child: DropdownButton<String>(
                    value: _selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue!;
                      });
                    },
                    items: <String>[
                      'Male',
                      'Female',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Color(0xffD3F2EE),
                child: Center(
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                    items: <String>['Dog', 'Cat', 'Cow', 'Rabbit']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            CustomTextFeild(
              title: 'Enter Breed Name',
              controller: breedController,
            ),
            CustomTextFeild(
              controller: ageController,
              title: 'Age ',
              myIcon: Icon(Icons.calendar_month),
            ),

            /*CustomTextFeild(
              title: 'Upload Image',
              myIcon: Icon(Icons.upload_file),
            ),*/

            CustomButton(
                title: 'Save',
                voidCallback: () async {
                  String uid = FirebaseAuth.instance.currentUser!.uid;
                  if (nameController.text.trim().isNotEmpty &&
                      breedController.text.trim().isNotEmpty &&
                      ageController.text.trim().isNotEmpty) {
                    PetModel pet = PetModel(
                        petId: "",
                        petName: nameController.text,
                        ownerId: uid,
                        doctorId: "",
                        gender: _selectedGender,
                        category: _selectedCategory,
                        breed: breedController.text,
                        age: ageController.text);
                    String response =
                        await PetRepository().createPetProfile(petModel: pet);
                    snackbarMessenger(context, response);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VeterinaryScreen(),
                        ));
                  } else {
                    snackbarMessenger(context, "Field cannot be empty");
                  }
                })
          ],
        ),
      ),
    );
  }
}
