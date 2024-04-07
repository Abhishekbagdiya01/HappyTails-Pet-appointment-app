import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_appointment_app/models/user_model.dart';
import 'package:pet_appointment_app/repository/doctor_repository/doctor_auth_repository.dart';

import 'package:pet_appointment_app/repository/user_repository/user_repository.dart';
import 'package:pet_appointment_app/screens/doctor_dashbord.dart';
import 'package:pet_appointment_app/screens/user_dashbord.dart';
import 'package:pet_appointment_app/screens/welcome/lets_star.dart';
import 'package:pet_appointment_app/utils/image_picker.dart';
import 'package:pet_appointment_app/utils/shared_preference.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';
import 'package:pet_appointment_app/widgets/custom_button.dart';
import 'package:pet_appointment_app/widgets/custom_textfeild.dart';

class UserProfilePageScreen extends StatefulWidget {
  const UserProfilePageScreen({super.key});

  @override
  State<UserProfilePageScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<UserProfilePageScreen> {
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
        future: UserRepository().getUserById(uid: uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserModel user = snapshot.data!;
            List navigationDeatails = [
              EditUserProfile(
                userModel: user,
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
                          child: user.profileUrl == ""
                              ? CircleAvatar(
                                  radius: 60,
                                  // backgroundImage: AssetImage(
                                  //     'assets/images/Salina_Zaman.png'),
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 60,
                                  backgroundImage:
                                      NetworkImage(user.profileUrl.toString()),
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
                            user.name,
                            style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: screenHeight * 0.32,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
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

class EditUserProfile extends StatefulWidget {
  EditUserProfile({required this.userModel, super.key});
  UserModel userModel;

  @override
  State<EditUserProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditUserProfile> {
  Uint8List? pickedImage;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.userModel.name;

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
                : widget.userModel.profileUrl != ""
                    ? CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage(widget.userModel.profileUrl),
                      )
                    : CircleAvatar(
                        radius: 100,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
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
            CustomButtom(
              title: "Save",
              voidCallback: () async {
                if (nameController.text.trim().isNotEmpty) {
                  UserModel user = UserModel(
                      uid: widget.userModel.uid,
                      name: nameController.text,
                      phoneNumber: widget.userModel.phoneNumber,
                      email: widget.userModel.email,
                      appointments: widget.userModel.appointments,
                      doctors: widget.userModel.doctors,
                      pets: widget.userModel.pets,
                      profileUrl: widget.userModel.profileUrl);
                  String response = await UserRepository()
                      .updateProfile(userModel: user, image: pickedImage!);
                  if (response == "Updated Successfully") {
                    snackbarMessenger(context, response);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDashbordPage(),
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
