import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
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
    DoctorModel? doctorInfo;
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
                doctorInfo = snapshot.data!;
                return Container(
                  width: screenWidth / 1,
                  height: screenHeight / 5,
                  color: Color(0xffBCF4DC),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      doctorInfo!.imageUrl == ""
                          ? CircleAvatar(
                              backgroundColor: Colors.cyan,
                              radius: 60,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 60,
                              backgroundImage:
                                  NetworkImage(doctorInfo!.imageUrl),
                            ),
                      Text(
                        ' Welcome Doctor ${doctorInfo!.name}',
                        style: GoogleFonts.jacquesFrancois(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
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
                          builder: (context) => AcceptedAppointmentListScreen(
                            DoctorInfo: doctorInfo!,
                          ),
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
            SizedBox(
              width: screenWidth / 100,
              height: screenHeight / 100,
            ),
            SizedBox(
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailedAppointmentPage(
                                            appointments:
                                                arrAppointments[index]),
                                  ));
                            },
                            child: Container(
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
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      FutureBuilder(
                                        future: PetRepository().getPetByID(
                                            petId:
                                                arrAppointments[index].petId),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            PetModel petInfo = snapshot.data!;
                                            return Text(
                                              'Category : ${petInfo.category}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
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

class DetailedAppointmentPage extends StatefulWidget {
  DetailedAppointmentPage({
    super.key,
    required this.appointments,
  });

  AppointmentModel appointments;

  @override
  State<DetailedAppointmentPage> createState() =>
      _DetailedAppointmentPageState();
}

class _DetailedAppointmentPageState extends State<DetailedAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointment details",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: PetRepository().getPetByID(petId: widget.appointments.petId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PetModel pet = snapshot.data!;
            return Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text(
                        "Pet name : ${widget.appointments.petName} ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "age : ${pet.age} ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "gender : ${pet.gender} ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "breed : ${pet.breed} ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "amount of feeding : ${widget.appointments.amountOfFeeding}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Brand of food : ${widget.appointments.brandOfFood}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Type of treats : ${widget.appointments.typeOfTreats}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Date : ${widget.appointments.date}   Time :  ${widget.appointments.time}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "diseases : ${widget.appointments.diseases}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      title: "Back",
                      voidCallback: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
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
