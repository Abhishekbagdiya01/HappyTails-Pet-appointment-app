import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/medicine_model.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/repository/appointment_repository.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_repository.dart';
import 'package:pet_appointment_app/repository/pet_repository.dart';
import 'package:pet_appointment_app/widgets/custom_button.dart';

class PetListScreen extends StatelessWidget {
  PetListScreen({super.key});
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine report"),
      ),
      body: FutureBuilder(
        future: PetRepository().getAllPetByUid(uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PetModel> pets = snapshot.data!;
            return ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth / 1,
                    height: screenHeight / 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(0xffBCF4DC),
                    ),
                    child: ListTile(
                        onLongPress: () {},
                        title: Text(
                          pets[index].petName,
                          style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        subtitle: Text(
                          pets[index].category,
                          style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ListOfMedicineReportScreen(
                                    pet: pets[index],
                                  ),
                                ));
                          },
                          child: Text(
                            'Check medicine report',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No medicine report for your pets"));
          }
        },
      ),
    );
  }
}

class ListOfMedicineReportScreen extends StatelessWidget {
  ListOfMedicineReportScreen({required this.pet, super.key});

  PetModel pet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 200),
            child: Container(
              height: 200,
              child: Column(
                children: [
                  Text(
                    'Your Pet Report',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jacquesFrancois(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image(image: AssetImage('assets/images/people_chat.png')),
                  Text(
                    ' Here is Your details ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jacquesFrancois(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: FutureBuilder(
        future: DoctorRepository().getMedicineReportByPetId(pet.petId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MedicineModel> reports = snapshot.data!;
            log(reports.length.toString());
            return ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    color: Color(0xffD9D9D9),
                    child: Column(
                      children: [
                        Text(
                          'Diagnosis Detail : ${reports[index].diagnosisDetails}',
                          style: GoogleFonts.jacquesFrancois(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          'Prescribed medication : ${reports[index].prescribedMedication} ',
                          style: GoogleFonts.jacquesFrancois(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          'Dosage : ${reports[index].dosage}',
                          style: GoogleFonts.jacquesFrancois(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          'Administration Route : ${reports[index].administrationRoute}',
                          style: GoogleFonts.jacquesFrancois(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          'Vaccine name : ${reports[index].vaccineName}',
                          style: GoogleFonts.jacquesFrancois(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          'Date Administered : ${reports[index].dateAdministered}',
                          style: GoogleFonts.jacquesFrancois(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          'Next due date : ${reports[index].nextDueDate}',
                          style: GoogleFonts.jacquesFrancois(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 4,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class MedicineReportUserPage extends StatefulWidget {
  //const MedicineReportUserPage({super.key});
  @override
  State<MedicineReportUserPage> createState() => _MedicineReportUserPageState();
}

class _MedicineReportUserPageState extends State<MedicineReportUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Pet Report',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(image: AssetImage('assets/images/people_chat.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Here is Your details ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 450,
                color: Color(0xffD9D9D9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Diagnosis Detail : xyz',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      'Prescribed medication : xyz ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      'Types of Treats :  ?? ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      'Dosage : pta nhii ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      'Administration Route : ',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      'Vaccine name : ???',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      'Date Administered : ???',
                      style: GoogleFonts.jacquesFrancois(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 8.0, left: 8.0, bottom: 8.0, top: 16.0),
                child: CustomButtom(title: 'Okay', voidCallback: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
