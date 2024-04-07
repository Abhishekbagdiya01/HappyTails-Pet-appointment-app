import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_repository.dart';
import 'package:pet_appointment_app/screens/schedul_date_page.dart';

class DoctorListPage extends StatefulWidget {
  DoctorListPage({required this.appointmentModel, super.key});
  AppointmentModel appointmentModel;
  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    // final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor List',
          textAlign: TextAlign.center,
          style: GoogleFonts.jacquesFrancois(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please enter Consult information',
              textAlign: TextAlign.start,
              style: GoogleFonts.jacquesFrancois(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              height: screenHeight * 0.8,
              //color: Colors.red,
              child: FutureBuilder(
                future: DoctorRepository().getAllDoctors(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DoctorModel> doctors = snapshot.data!;
                    return ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScheduleDateScreen(
                                      appointmentModel: widget.appointmentModel,
                                      doctor: doctors[index],
                                    ),
                                  ));
                            },
                            child: Container(
                                width: screenWidth / 1,
                                height: screenHeight / 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Color(0xFFBCF4DC),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          doctors[index].imageUrl == ""
                                              ? CircleAvatar(
                                                  radius: 55,
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 50,
                                                  ),
                                                )
                                              : CircleAvatar(
                                                  radius: 55,
                                                  backgroundImage: NetworkImage(
                                                      doctors[index].imageUrl),
                                                )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doctors[index].name.toString(),
                                              style:
                                                  GoogleFonts.jacquesFrancois(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF2260FF)

                                                      //const Color(0xffD3F2EE)
                                                      ),
                                            ),
                                            Text(
                                              doctors[index].degree.toString(),
                                              style:
                                                  GoogleFonts.jacquesFrancois(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Color(0xFF2260FF)

                                                      //const Color(0xffD3F2EE)
                                                      ),
                                            ),
                                            Text(
                                              doctors[index]
                                                  .specialization
                                                  .toString(),
                                              style:
                                                  GoogleFonts.jacquesFrancois(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey

                                                      //const Color(0xffD3F2EE)
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasData) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
