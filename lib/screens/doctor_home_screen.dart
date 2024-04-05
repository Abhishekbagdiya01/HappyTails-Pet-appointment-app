import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/repository/appointment_repository.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_repository.dart';
import 'package:pet_appointment_app/repository/pet_repository.dart';
import 'package:pet_appointment_app/screens/view_accepted_appointment_screen.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;

    List detailsOfPet = [
      {
        'Pet Name': 'Charlie',
        'Category': 'Dog',
        'Date': '08-jan-2024',
        'Time': '2:30 PM'
      },
      {
        'Pet Name': 'Janny',
        'Category': 'Cat',
        'Date': '10-jan-2024',
        'Time': '4:30 PM'
      },
      {
        'Pet Name': 'Olly',
        'Category': 'Rabbit',
        'Date': '18-jan-2024',
        'Time': '9:30 PM'
      },
      {
        'Pet Name': 'Maya',
        'Category': 'Cow',
        'Date': '28-jan-2024',
        'Time': '7:30 PM'
      },
      {
        'Pet Name': 'Charlie',
        'Category': 'Dog',
        'Date': '08-jan-2024',
        'Time': '2:30 PM'
      },
      {
        'Pet Name': 'Janny',
        'Category': 'Cat',
        'Date': '10-jan-2024',
        'Time': '4:30 PM'
      },
      {
        'Pet Name': 'Olly',
        'Category': 'Rabbit',
        'Date': '18-jan-2024',
        'Time': '9:30 PM'
      },
      {
        'Pet Name': 'Maya',
        'Category': 'Cow',
        'Date': '28-jan-2024',
        'Time': '7:30 PM'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBCF4DC),
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            screenHeight / 5,
          ),
          child: FutureBuilder(
            future: DoctorRepository().getDoctorById(uid: uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                DoctorModel doctorInfo = snapshot.data!;
                return Container(
                  width: screenWidth / 1,
                  height: screenHeight / 5,
                  color: Color(0xffBCF4DC),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: doctorInfo.imageUrl == ""
                            ? CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 60,
                                backgroundImage: AssetImage(
                                    'assets/images/Salina_Zaman.png'),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(doctorInfo.imageUrl!),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' Welcome Doctor Sumit',
                          style: GoogleFonts.jacquesFrancois(
                            fontWeight: FontWeight.normal,
                            //const Color(0xffD3F2EE)
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(child: LinearProgressIndicator());
              }
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcceptedAppointmentListScreen(),
                        ));
                  },
                  child: Card(
                      color: Color(0xFFFFEADE),
                      child: Container(
                        height: 130,
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                    'assets/images/street-view.png')),
                            Text(
                              'View\n appointment',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.jacquesFrancois(
                                  fontWeight: FontWeight.normal, fontSize: 18),
                            ),
                          ],
                        ),
                      )),
                ),
                Card(
                    color: Color(0xFFFFEADE),
                    child: Container(
                      height: 130,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/images/shoes.png')),
                          Text(
                            'Medicine',
                            style: GoogleFonts.jacquesFrancois(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              width: screenWidth / 100,
              height: screenHeight / 100,
            ),
            Container(
              width: screenWidth / 1.05,
              height: screenHeight / 20,
              child: Text(
                "Appointment pending requests :-",
                style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.normal, fontSize: 24),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: AppointmentRepository()
                    .getAllAppointmentRequestedTodoctor(doctorId: uid),
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
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color(0xffBCF4DC)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Pet Name : ${arrAppointments[index].petName}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    FutureBuilder(
                                      future: PetRepository().getPetByID(
                                          petId: arrAppointments[index].petId),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            'Category : ${detailsOfPet[index]['Category'].toString()}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          );
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      },
                                      // child: Text(
                                      //   'Category : ${detailsOfPet[index]['Category'].toString()}',
                                      //   style: TextStyle(
                                      //       color: Colors.black, fontSize: 20),
                                      // ),
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
                                          color: Colors.black, fontSize: 20),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () async {
                                          String response =
                                              await AppointmentRepository()
                                                  .rejectAppointmentByDoctor(
                                                      appointmentModel:
                                                          arrAppointments[
                                                              index]);
                                          if (response ==
                                              "Appointment removed") {
                                            snackbarMessenger(
                                                context, response);
                                          } else {}
                                          setState(() {
                                            snackbarMessenger(
                                                context, response);
                                          });
                                        },
                                        child: Text(
                                          'Reject',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        onPressed: () async {
                                          String response =
                                              await AppointmentRepository()
                                                  .acceptAppointmentByDoctor(
                                                      appointmentModel:
                                                          arrAppointments[
                                                              index]);
                                          if (response ==
                                              "Appointment accepted") {
                                            snackbarMessenger(
                                                context, response);
                                          } else {}
                                          setState(() {
                                            snackbarMessenger(
                                                context, response);
                                          });
                                        },
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ],
                                ),
                              ],
                            ),
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pet_appointment_app/models/appointment_model.dart';
// import 'package:pet_appointment_app/models/doctor_model.dart';
// import 'package:pet_appointment_app/repository/appointment_repository.dart';
// import 'package:pet_appointment_app/repository/doctor_repository/doctor_repository.dart';

// class DoctorHomePage extends StatefulWidget {
//   const DoctorHomePage({Key? key}) : super(key: key);

//   @override
//   State<DoctorHomePage> createState() => _DoctorHomePageState();
// }

// class _DoctorHomePageState extends State<DoctorHomePage> {
//   DoctorModel? doctorModel;
//   List<AppointmentModel>? listOfRequestedAppointments;
//   @override
//   listOfallPendingRequest() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     listOfRequestedAppointments = await AppointmentRepository()
//         .getAllAppointmentRequestedTodoctor(doctorId: uid);
//     setState(() {});
//   }

//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getDoctorDetails();
//     listOfallPendingRequest();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.sizeOf(context);
//     final double screenWidth = screenSize.width;
//     final double screenHeight = screenSize.height;

//     // Retrive information about the device's orientation
//     final Orientation orientation = MediaQuery.of(context).orientation;

//     List detailsOfPet = [
//       {
//         'Pet Name': 'Charlie',
//         'Category': 'Dog',
//         'Date': '08-jan-2024',
//         'Time': '2:30 PM'
//       },
//       {
//         'Pet Name': 'Janny',
//         'Category': 'Cat',
//         'Date': '10-jan-2024',
//         'Time': '4:30 PM'
//       },
//       {
//         'Pet Name': 'Olly',
//         'Category': 'Rabbit',
//         'Date': '18-jan-2024',
//         'Time': '9:30 PM'
//       },
//       {
//         'Pet Name': 'Maya',
//         'Category': 'Cow',
//         'Date': '28-jan-2024',
//         'Time': '7:30 PM'
//       },
//       {
//         'Pet Name': 'Charlie',
//         'Category': 'Dog',
//         'Date': '08-jan-2024',
//         'Time': '2:30 PM'
//       },
//       {
//         'Pet Name': 'Janny',
//         'Category': 'Cat',
//         'Date': '10-jan-2024',
//         'Time': '4:30 PM'
//       },
//       {
//         'Pet Name': 'Olly',
//         'Category': 'Rabbit',
//         'Date': '18-jan-2024',
//         'Time': '9:30 PM'
//       },
//       {
//         'Pet Name': 'Maya',
//         'Category': 'Cow',
//         'Date': '28-jan-2024',
//         'Time': '7:30 PM'
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffBCF4DC),
//         bottom: PreferredSize(
//           preferredSize: Size(
//             double.infinity,
//             screenHeight / 5,
//           ),
//           child: Container(
//             width: screenWidth / 1,
//             height: screenHeight / 5,
//             color: Color(0xffBCF4DC),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.black,
//                     radius: 60,
//                     backgroundImage:
//                         AssetImage('assets/images/Salina_Zaman.png'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: doctorModel == null
//                       ? CircularProgressIndicator()
//                       : Text(
//                           ' ${doctorModel!.name}',
//                           style: GoogleFonts.jacquesFrancois(
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: screenHeight / 30,
//             ),
//             /*Padding(
//               padding: const EdgeInsets.symmetric(vertical: 25),
//               child: SearchBar(),
//             ),*/
//             Container(
//               width: screenWidth / 2,
//               height: screenHeight / 4,
//               color: Colors.grey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                       onPressed: () {},
//                       icon: Image.asset('assets/images/street-view.png')),
//                   Text(
//                     'View appointment',
//                     style: GoogleFonts.jacquesFrancois(
//                       fontWeight: FontWeight.normal,
//                       //const Color(0xffD3F2EE)
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       icon: Image.asset('assets/images/shoes.png')),
//                   Text(
//                     'Medicine',
//                     style: GoogleFonts.jacquesFrancois(
//                       fontWeight: FontWeight.normal,
//                       //const Color(0xffD3F2EE)
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: screenWidth / 100,
//               height: screenHeight / 100,
//             ),
//             Container(
//               width: screenWidth / 1.05,
//               height: screenHeight / 20,
//               //color: Colors.red,
//               child: Text(
//                 "Today's Appointments:-",
//                 style: GoogleFonts.jacquesFrancois(
//                     fontWeight: FontWeight.normal, fontSize: 24

//                     //const Color(0xffD3F2EE)
//                     ),
//               ),
//             ),
//             SizedBox(
//               width: screenWidth / 1.05,
//               height: screenHeight / 0.2,
//               // color: Colors.red
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: detailsOfPet.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: 100,
//                       height: 120,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(14),
//                           color: Color(0xffBCF4DC)),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 'Pet Name : ${detailsOfPet[index]['Pet Name'].toString()}',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 20),
//                               ),
//                               Text(
//                                 'Category : ${detailsOfPet[index]['Category'].toString()}',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 20),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 'Date : ${detailsOfPet[index]['Date'].toString()}',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 20),
//                               ),
//                               Text(
//                                 'Time : ${detailsOfPet[index]['Time'].toString()}',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.red),
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Cancel',
//                                     style: TextStyle(color: Colors.black),
//                                   )),
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.green),
//                                 onPressed: () {
//                                   // Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //       builder: (context) =>
//                                   //           ScheduleAppointmentPage(),
//                                   //     ));
//                                 },
//                                 child: Text(
//                                   "Accept",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   getDoctorDetails() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     doctorModel = await DoctorRepository().getDoctorById(uid: uid);
//     setState(() {});
//   }
// }
