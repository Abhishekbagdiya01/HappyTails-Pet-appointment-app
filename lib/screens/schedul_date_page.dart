import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/screens/preview_scheduled_page.dart';
import 'package:table_calendar/table_calendar.dart';
import '../customButton/custom_button.dart';

class ScheduleDateScreen extends StatefulWidget {
  ScheduleDateScreen({required this.appointmentModel, required this.doctor});
  AppointmentModel appointmentModel;
  DoctorModel doctor;
  @override
  State<ScheduleDateScreen> createState() => _ScheduleDateState();
}

class _ScheduleDateState extends State<ScheduleDateScreen> {
  String _selectedItem = 'Doctor Speciality';

  DateTime today = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  String time = "";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule an\n Appointment    ',
          textAlign: TextAlign.center,
          style: GoogleFonts.jacquesFrancois(
            fontSize: 24,
            fontWeight: FontWeight.bold,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Color(0xFFBCF4DC),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundImage:
                                NetworkImage(widget.doctor.imageUrl.toString()),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.doctor.name,
                              style: GoogleFonts.jacquesFrancois(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2260FF)),
                            ),
                            Text(
                              widget.doctor.degree,
                              style: GoogleFonts.jacquesFrancois(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF2260FF)),
                            ),
                            Text(
                              widget.doctor.specialization,
                              style: GoogleFonts.jacquesFrancois(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' Mon - Sat / 9 AM - 4 PM',
                                    style: GoogleFonts.jacquesFrancois(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF2260FF)

                                        //const Color(0xffD3F2EE)
                                        ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              width: screenWidth / 1,
              height: screenHeight / 2.2,
              child: TableCalendar(
                  //firstDay: DateTime.utc(2010, 10, 16),
                  firstDay: DateTime.now(),
                  focusedDay: DateTime.now(),
                  //today,
                  lastDay: DateTime.utc(2030, 3, 14),
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Available Time',
                    style: GoogleFonts.jacquesFrancois(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF2260FF)),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                InkWell(
                  onTap: () {
                    time = '9:00 AM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "9:00 AM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('9:00 AM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '9:30 AM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "9:30 AM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('9:30 AM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '10:00 AM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "10:00 AM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('10:00 AM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '10:30 AM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "10:30 AM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('10:30 AM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '11:00 AM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "11:00 AM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('11:00 AM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '12:00 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "12:00 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('12:00 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '12:30 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "12:30 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('12:30 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '1:00 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "1:00 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('1:00 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '1:30 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "1:30 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('1:30 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '2:00 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "2:00 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('2:00 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '2:30 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "2:30 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('2:30 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '3:00 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "3:00 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('3:00 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '3:30 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "3:30 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('3:30 PM'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    time = '4:00 PM';
                    setState(() {});
                  },
                  child: Chip(
                    color: time == "4:00 PM"
                        ? MaterialStatePropertyAll(Colors.blue)
                        : MaterialStatePropertyAll(Colors.transparent),
                    label: Text('4:00 PM'),
                  ),
                ),
              ],
            ),
            CustomButton(
                title: 'Schedule',
                voidCallback: () async {
                  print(time);
                  print(_selectedDay.toString());
                  AppointmentModel appointmentModel = AppointmentModel(
                      appointmentId: "",
                      petId: widget.appointmentModel.petId,
                      userId: widget.appointmentModel.userId,
                      doctorId: widget.doctor.uid,
                      petName: widget.appointmentModel.petName,
                      date:
                          "${_selectedDay.day}-${_selectedDay.month}-${_selectedDay.year}",
                      time: time,
                      brandOfFood: widget.appointmentModel.brandOfFood,
                      typeOfTreats: widget.appointmentModel.typeOfTreats,
                      amountOfFeeding: widget.appointmentModel.amountOfFeeding,
                      diseases: widget.appointmentModel.diseases);

                  // AppointmentRepository()
                  //     .createAppointment(appointmentModel: appointmentModel);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreviewScheduledPage(
                          appointment: appointmentModel,
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
