import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/repository/pet_repository.dart';

import 'package:pet_appointment_app/screens/pet_profile_page.dart';
import 'package:pet_appointment_app/screens/vet_Screen.dart';

class VeterinaryScreen extends StatefulWidget {
  @override
  State<VeterinaryScreen> createState() => _AppointmentListPageState();
}

class _AppointmentListPageState extends State<VeterinaryScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBCF4DC),
        title: Text("Pet list"),
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
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                  "Are you sure you want to delete Pet profile?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      PetRepository().deletePetProfile(
                                          petId: pets[index].petId);
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text("Yes")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No")),
                              ],
                            ),
                          );
                        },
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
                                      VetScreen(pet: pets[index]),
                                ));
                          },
                          child: Text(
                            'Book an appointment',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                );
              },
            );
          } else {
            return Center(
                child: Text("No pet's are found press + to add pets"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetProfilePage(),
                ));
          }),
    );
  }
}
