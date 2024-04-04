import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/screens/doctor_list_page.dart';
import '../customButton/custom_button.dart';
import '../widgets/custom_textfeild.dart';

class VetScreen extends StatefulWidget {
  VetScreen({required this.pet});
  @override
  PetModel pet;

  State<VetScreen> createState() => _VetScreenState();
}

class _VetScreenState extends State<VetScreen> {
  TextEditingController amountOfFeeding = TextEditingController();
  TextEditingController brandOfFood = TextEditingController();
  TextEditingController typeOfTreat = TextEditingController();

  List<bool> _checkedItems = List.generate(5, (index) => false);
  List details = [
    "Coughing",
    "Sneezing",
    "Vomiting",
    "Diarrhea",
    "Etc...     "
  ];
  List<bool> _isChecked = [];
  String selectedDiseases = '';

  @override
  void initState() {
    super.initState();
    _isChecked = List.filled(details.length, false); // Initialize all unchecked
  }

  void selectedItems() {
    selectedDiseases = "";
    for (int i = 0; i < _isChecked.length; i++) {
      if (_isChecked[i]) {
        selectedDiseases +=
            '${details[i]}, '; // Add comma and space for separation
      }
    }
    // if (selectedDiseases.isNotEmpty) {
    //   selectedDiseases = selectedDiseases.substring(
    //       0, selectedDiseases.length - 2); // Remove trailing comma and space
    //   print('Selected Text: $selectedDiseases');
    // } else {
    //   print('No items selected');
    // }
  }

  @override
  Widget build(BuildContext context) {
/*
    MyCheckBoxList(options: [
      'Coughing',
      'Sneezing',
      'Vomiting',
      'Diarrhea',
      'Etc...   '
    ]);*/

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Schedule an\n Appointment',
          textAlign: TextAlign.center,
          style: GoogleFonts.jacquesFrancois(
            fontSize: 24,
            fontWeight: FontWeight.bold,

            //const Color(0xffD3F2EE)
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please enter diet and feeding information',
                textAlign: TextAlign.center,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
            ),
            CustomTextFeild(
              title: 'Bread of Food',
              controller: brandOfFood,
            ),
            CustomTextFeild(
              title: 'Amount of Feeding',
              controller: amountOfFeeding,
            ),
            CustomTextFeild(
              title: 'Type of Treats',
              controller: typeOfTreat,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Check the conditions that apply to your pet',
                textAlign: TextAlign.center,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 350,
              color: Colors.white,
              child: Column(
                children: [
                  for (int i = 0; i < details.length; i++)
                    CheckboxListTile(
                      title: Text(details[i]),
                      value: _isChecked[i],
                      onChanged: (value) =>
                          setState(() => _isChecked[i] = value!),
                    ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     return printSelectedData();
                  //   },
                  //   child: Text('Print Selected Data'),
                  // ),
                ],
              ),
            ),
            CustomButton(
                title: 'Next...',
                voidCallback: () {
                  selectedItems();
                  log(selectedDiseases);
                  AppointmentModel appointmentModel = AppointmentModel(
                      appointmentId: "",
                      userId: widget.pet.ownerId,
                      amountOfFeeding: amountOfFeeding.text,
                      brandOfFood: brandOfFood.text,
                      typeOfTreats: typeOfTreat.text,
                      diseases: selectedDiseases,
                      petName: widget.pet.petName,
                      petId: widget.pet.petId,
                      doctorId: "",
                      date: "",
                      time: "");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorListPage(
                          appointmentModel: appointmentModel,
                        ),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
