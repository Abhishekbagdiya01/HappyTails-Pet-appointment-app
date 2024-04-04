import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
import 'package:pet_appointment_app/screens/medicine_report_user_page.dart';

class MedicineReportPage extends StatefulWidget {
  //const MedicineReportPage({super.key});
  @override
  State<MedicineReportPage> createState() => _MedicineReportPageState();
}

class _MedicineReportPageState extends State<MedicineReportPage> {
  TextEditingController diagnosisDetailsController = TextEditingController();
  TextEditingController prescriberMedicineController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController administrationRouteController = TextEditingController();
  TextEditingController dateAdministeredController = TextEditingController();
  TextEditingController vaccineNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Report',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jacquesFrancois(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                        //const Color(0xffD3F2EE)
                      ),
                    ),
                  ),
                  Image(image: AssetImage('assets/images/people_chat.png')),
                ],
              ),
              Text(
                'Pet Information:',
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth / 1,
                  height: screenHeight / 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFBCF4DC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Enter Pet Information(fetch from\n Vetschedule1 Page and list of\n appointment)',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jacquesFrancois(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,

                        //const Color(0xffD3F2EE)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth / 1,
                  height: screenHeight / 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFBCF4DC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: diagnosisDetailsController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Diagnosis Detail'),
                    ),
                    /*child: Text(
                      "Diagnosis Detail(Provide a\n detailed description of the\n pet's condition.)",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jacquesFrancois(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,

                        //const Color(0xffD3F2EE)
                      ),
                    ),*/
                  ),
                ),
              ),
              Text(
                'Prescription:',
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth / 1,
                  height: screenHeight / 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFBCF4DC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: prescriberMedicineController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Prescribed medication'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth / 1,
                  height: screenHeight / 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFBCF4DC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: dosageController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Dosage'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth / 1,
                  height: screenHeight / 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFBCF4DC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: administrationRouteController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Administration Route'),
                    ),
                  ),
                ),
              ),
              /*Container(
                width: screenWidth / 1,
                height: screenHeight / 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Color(0xFFBCF4DC),
                ),
              ),*/
              Text(
                'Vaccination Detail:',
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth / 1,
                  height: screenHeight / 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFBCF4DC),
                  ),
                  child: TextField(
                    controller: vaccineNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Vaccine Name'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth / 1,
                  height: screenHeight / 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xFFBCF4DC),
                  ),
                  child: TextField(
                    controller: dateAdministeredController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Date Administered'),
                  ),
                ),
              ),
              CustomButton(
                  title: 'Okay',
                  voidCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicineReportUserPage(),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
