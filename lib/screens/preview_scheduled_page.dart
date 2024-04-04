import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:pet_appointment_app/repository/appointment_repository.dart';
import 'package:pet_appointment_app/screens/user_home_screen.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';

import '../customButton/custom_button.dart';

class PreviewScheduledPage extends StatefulWidget {
  PreviewScheduledPage({required this.appointment, super.key});

  AppointmentModel appointment;
  @override
  State<PreviewScheduledPage> createState() => _ScheduledPageState();
}

class _ScheduledPageState extends State<PreviewScheduledPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Appointment \n Scheduled!',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,

            //const Color(0xffD3F2EE)
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' Here is Your details ',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
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
                    'Pet Name : ${widget.appointment.petName}',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black

                        //const Color(0xffD3F2EE)
                        ),
                  ),
                  Text(
                    'Brand of Food :  ${widget.appointment.brandOfFood}',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black

                        //const Color(0xffD3F2EE)
                        ),
                  ),
                  Text(
                    'Amount of Feeding :  ${widget.appointment.amountOfFeeding} ',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black

                        //const Color(0xffD3F2EE)
                        ),
                  ),
                  Text(
                    'Types of Treats :  ?? ',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  Text(
                    'diseases : ${widget.appointment.diseases} ',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  Text(
                    'Date & Time :  ${widget.appointment.date}  ${widget.appointment.time}',
                    style: GoogleFonts.roboto(
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
              child: CustomButton(
                  title: 'Done',
                  voidCallback: () async {
                    String response = await AppointmentRepository()
                        .createAppointment(
                            appointmentModel: widget.appointment);
                    if (response == "Appointment submitted") {
                      snackbarMessenger(context, "Appointment submitted");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserHomeScreen(),
                          ),
                          (route) => false);
                    } else {
                      snackbarMessenger(context, response);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
