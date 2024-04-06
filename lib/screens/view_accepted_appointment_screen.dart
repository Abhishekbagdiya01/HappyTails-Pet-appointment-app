import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/repository/pet_repository.dart';
import 'package:pet_appointment_app/screens/medicine_report_page.dart';

import '../models/appointment_model.dart';
import '../repository/appointment_repository.dart';

class AcceptedAppointmentListScreen extends StatefulWidget {
  AcceptedAppointmentListScreen({required this.DoctorInfo, super.key});
  DoctorModel DoctorInfo;
  @override
  State<AcceptedAppointmentListScreen> createState() =>
      _GenerateReportPageState();
}

class _GenerateReportPageState extends State<AcceptedAppointmentListScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBCF4DC),
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            screenHeight / 5,
          ),
          child: Container(
            width: screenWidth / 1,
            height: screenHeight / 5,
            color: Color(0xffBCF4DC),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.DoctorInfo.imageUrl == ""
                    ? CircleAvatar(
                        backgroundColor: Colors.cyan,
                        radius: 60,
                        // backgroundImage:
                        //     AssetImage('assets/images/Salina_Zaman.png'),
                        child: Icon(Icons.person),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            NetworkImage(widget.DoctorInfo.imageUrl),
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.DoctorInfo.name,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth / 100,
              height: screenHeight / 100,
            ),
            Container(
              width: screenWidth / 1.05,
              height: screenHeight / 20,
              //color: Colors.red,
              child: Text(
                "Completed Appointment:-",
                style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.normal, fontSize: 24),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: FutureBuilder(
                future: AppointmentRepository()
                    .getAllAppointmentAcceptedByDoctorId(doctorId: uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<AppointmentModel> arrAppointments = snapshot.data!;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: arrAppointments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            future: PetRepository().getPetByID(
                                petId: arrAppointments[index].petId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                PetModel pet = snapshot.data!;
                                return Container(
                                  width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color(0xffBCF4DC)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Pet Name : ${arrAppointments[index].petName}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'Category : ${pet.category}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Date : ${arrAppointments[index].date}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'Time : ${arrAppointments[index].time}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MedicineReportPage(
                                                    petInfo: pet,
                                                  ),
                                                ));
                                          },
                                          child: const Text(
                                            "Generate",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ))
                                    ],
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                            // child: Container(
                            //   width: 100,
                            //   height: 150,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(14),
                            //       color: Color(0xffBCF4DC)),
                            //   child: Column(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Text(
                            //             'Pet Name : ${arrAppointments[index].petName}',
                            //             style: TextStyle(
                            //                 color: Colors.black, fontSize: 20),
                            //           ),
                            //           FutureBuilder(
                            //             future: PetRepository().getPetByID(
                            //                 petId:
                            //                     arrAppointments[index].petId),
                            //             builder: (context, snapshot) {
                            //               if (snapshot.hasData) {
                            //                 return Text(
                            //                   'Category : ${snapshot.data!.category}',
                            //                   style: TextStyle(
                            //                       color: Colors.black,
                            //                       fontSize: 20),
                            //                 );
                            //               } else {
                            //                 return CircularProgressIndicator();
                            //               }
                            //             },
                            //           ),
                            //         ],
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Text(
                            //             'Date : ${arrAppointments[index].date}',
                            //             style: TextStyle(
                            //                 color: Colors.black, fontSize: 20),
                            //           ),
                            //           Text(
                            //             'Time : ${arrAppointments[index].time}',
                            //             style: TextStyle(
                            //               color: Colors.black,
                            //               fontSize: 20,
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //       ElevatedButton(
                            //           onPressed: () {
                            //             Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       MedicineReportPage(petInfo: pet,),
                            //                 ));
                            //           },
                            //           child: const Text(
                            //             "Generate",
                            //             style: TextStyle(color: Colors.black),
                            //           ))
                            //     ],
                            //   ),
                            // ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
