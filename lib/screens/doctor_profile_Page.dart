import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_auth_repository.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_repository.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';
import 'package:pet_appointment_app/screens/welcome/lets_star.dart';
import 'package:pet_appointment_app/utils/image_picker.dart';
import 'package:pet_appointment_app/utils/shared_preference.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';
import 'package:pet_appointment_app/widgets/custom_button.dart';
import 'package:pet_appointment_app/widgets/custom_textfeild.dart';

class DoctorProfilePageScreen extends StatefulWidget {
  const DoctorProfilePageScreen({super.key});

  @override
  State<DoctorProfilePageScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<DoctorProfilePageScreen> {
  List details = [
    {'img': 'assets/images/profile_icon.png', 'title': 'Profile'},
    // {'img': 'assets/images/fav.png', 'title': 'Favorite'},
    // {'img': 'assets/images/wallet.png', 'title': 'Payment Method'},
    {'img': 'assets/images/lock.png', 'title': 'Privacy Policy'},
    {'img': 'assets/images/setting.png', 'title': 'Settings'},
    {'img': 'assets/images/help.png', 'title': 'FAQ'},
    // {'img': 'assets/images/logout.png', 'title': 'Logout'},
  ];
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Profile',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2260FF)),
        ),
      ),
      body: FutureBuilder(
        future: DoctorRepository().getDoctorById(uid: uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DoctorModel doctor = snapshot.data!;
            List navigationDeatails = [
              EditDoctorProfile(
                doctorModel: doctor,
              )
              // FAQPage(),
              // FAQPage(),
              // FAQPage(),
              // FAQPage(),
              // FAQPage(),
            ];
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: doctor.imageUrl == ""
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
                                      NetworkImage(doctor.imageUrl.toString()),
                                ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            doctor.name,
                            style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              //const Color(0xffD3F2EE)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: screenHeight * 0.33,
                      //color: Colors.red,
                      child: ListView.builder(
                        itemCount: details.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          navigationDeatails[index],
                                    ));
                              },
                              child: ListTile(
                                leading: Image.asset(
                                    details[index]['img'].toString()),
                                title: Text(details[index]['title'].toString()),
                                trailing: Icon(Icons.keyboard_arrow_right),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        DoctorAuthRepository().logoutDoctor();
                        SharedPref().setAccountType("");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => letsStart(),
                            ),
                            (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset("assets/images/logout.png"),
                          title: Text("Logout"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
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

class EditDoctorProfile extends StatefulWidget {
  EditDoctorProfile({required this.doctorModel, super.key});
  DoctorModel doctorModel;

  @override
  State<EditDoctorProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  Uint8List? pickedImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = widget.doctorModel.name;
    degreeController.text = widget.doctorModel.degree;
    specializationController.text = widget.doctorModel.specialization;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pickedImage != null
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: MemoryImage(pickedImage!),
                  )
                : widget.doctorModel.imageUrl != ""
                    ? CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage(widget.doctorModel.imageUrl),
                      )
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            AssetImage("assets/images/Salina_Zaman.png"),
                      ),
            SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        pickedImage = await pickImage(ImageSource.camera);
                        setState(() {});
                      },
                      icon: Icon(Icons.camera_alt)),
                  IconButton(
                      onPressed: () async {
                        pickedImage = await pickImage(ImageSource.gallery);
                        setState(() {});
                      },
                      icon: Icon(Icons.photo))
                ],
              ),
            ),
            CustomTextFeild(
              title: "Name",
              controller: nameController,
            ),
            CustomTextFeild(
              title: "Degree",
              controller: degreeController,
            ),
            CustomTextFeild(
              title: "Specialization",
              controller: specializationController,
            ),
            CustomButtom(
              title: "Save",
              voidCallback: () async {
                if (nameController.text.trim().isNotEmpty &&
                    degreeController.text.trim().isNotEmpty &&
                    specializationController.text.trim().isNotEmpty) {
                  DoctorModel doctor = DoctorModel(
                      uid: widget.doctorModel.uid,
                      name: nameController.text,
                      phoneNumber: widget.doctorModel.phoneNumber,
                      email: widget.doctorModel.email,
                      degree: degreeController.text,
                      specialization: specializationController.text,
                      imageUrl: widget.doctorModel.imageUrl);
                  String response = await DoctorRepository()
                      .updateProfile(doctorModel: doctor, image: pickedImage);
                  if (response == "Updated Successfully") {
                    snackbarMessenger(context, response);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDashboard(),
                        ),
                        (route) => false);
                  } else {
                    snackbarMessenger(context, response);
                  }
                } else {
                  snackbarMessenger(context, "Field cannot be empty");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
