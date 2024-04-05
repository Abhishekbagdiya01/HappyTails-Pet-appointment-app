import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
import 'package:pet_appointment_app/models/medicine_model.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_repository.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';

class MedicineReportPage extends StatefulWidget {
  MedicineReportPage({required this.petInfo, super.key});
  PetModel petInfo;
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
  TextEditingController nextDueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(
              double.infinity,
              screenHeight * .1,
            ),
            child: Center(
              child: Container(
                child: Row(
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
                        ),
                      ),
                    ),
                    Image(image: AssetImage('assets/images/people_chat.png')),
                  ],
                ),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: screenHeight * .7,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pet Information:',
                      style: GoogleFonts.jacquesFrancois(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                        //const Color(0xffD3F2EE)
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth / 1,
                    height: screenHeight / 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(0xFFBCF4DC),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Pet name : ${widget.petInfo.petName}  Pet category : ${widget.petInfo.category} \n  Pet age : ${widget.petInfo.age}   Pet breed : ${widget.petInfo.breed}     ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jacquesFrancois(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,

                          //const Color(0xffD3F2EE)
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
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Prescription:',
                      style: GoogleFonts.jacquesFrancois(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Vaccination Detail:',
                      style: GoogleFonts.jacquesFrancois(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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
                        controller: nextDueDateController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Next due date'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
                title: 'Okay',
                voidCallback: () async {
                  MedicineModel medicineModel = MedicineModel(
                      medicineId: "",
                      ownerId: widget.petInfo.ownerId,
                      petId: widget.petInfo.petId,
                      diagnosisDetails: diagnosisDetailsController.text,
                      prescribedMedication: prescriberMedicineController.text,
                      dosage: dosageController.text,
                      vaccineName: vaccineNameController.text,
                      administrationRoute: administrationRouteController.text,
                      dateAdministered: dateAdministeredController.text,
                      nextDueDate: nextDueDateController.text);
                  String response = await DoctorRepository()
                      .createMedicinePrescribtion(medicineModel: medicineModel);

                  if (response == "Medicine prescribition created") {
                    snackbarMessenger(context, response.toString());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDashboard(),
                        ),
                        (route) => false);
                  } else {
                    snackbarMessenger(context, response.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
