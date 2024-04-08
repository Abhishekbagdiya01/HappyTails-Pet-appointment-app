import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/screens/veterinary_screen.dart';

import '../customButton/custom_button.dart';
import '../repository/pet_repository.dart';
import '../utils/snackbar.dart';
import '../widgets/custom_textfeild.dart';

class EditPetProfile extends StatefulWidget {
  EditPetProfile({required this.pet, super.key});
  PetModel pet;

  @override
  State<EditPetProfile> createState() => _EditPetProfileState();
}

class _EditPetProfileState extends State<EditPetProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = widget.pet.petName;
    breedController.text = widget.pet.breed;
    ageController.text = widget.pet.age;
    String _selectedGender = widget.pet.gender;
    String _selectedCategory = widget.pet.category;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit pet"),
      ),
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
                  if (nameController.text.trim().isNotEmpty &&
                      breedController.text.trim().isNotEmpty &&
                      ageController.text.trim().isNotEmpty) {
                    PetModel pet = PetModel(
                        petId: widget.pet.petId,
                        petName: nameController.text,
                        ownerId: widget.pet.ownerId,
                        doctorId: "",
                        gender: _selectedGender,
                        category: _selectedCategory,
                        breed: breedController.text,
                        age: ageController.text);
                    String response =
                        await PetRepository().editPetProfile(petModel: pet);
                    snackbarMessenger(context, response);
                    Navigator.pop(context);
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
