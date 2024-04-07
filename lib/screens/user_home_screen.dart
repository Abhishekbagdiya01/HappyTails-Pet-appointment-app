import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/models/user_model.dart';
import 'package:pet_appointment_app/repository/user_repository/user_repository.dart';
import 'package:pet_appointment_app/screens/medicine_report_user_page.dart';
import 'package:pet_appointment_app/screens/training_page.dart';
import 'package:pet_appointment_app/screens/veterinary_screen.dart';
import 'package:pet_appointment_app/screens/socialization_screen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserDashBordPageOneState();
}

class _UserDashBordPageOneState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;

    List Details = [
      {'img': 'assets/images/box.png', 'title': 'Veterinary'},
      {'img': 'assets/images/shoes.png', 'title': 'Medicine'},
      {'img': 'assets/images/flag.png', 'title': 'Training'},
      {'img': 'assets/images/Socialization.png', 'title': 'Socialization'},
      // {'img': 'assets/images/cat.png', 'title': 'Appointment'},
      // {'img': 'assets/images/cat.png', 'title': 'Adopt a Pet'},
    ];

    List<Widget> NavigationDetails = [
      VeterinaryScreen(), PetListScreen(), TrainingPage(),
      SocializationScreen()

      //TrainingPage(),
    ];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBCF4DC),
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            screenHeight / 6,
          ),
          child: FutureBuilder(
            future: UserRepository().getUserById(uid: uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data!;
                return Container(
                  width: double.infinity,
                  color: Color(0xffBCF4DC),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: user.profileUrl == ""
                            ? CircleAvatar(
                                radius: 60,
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.cyan,
                                radius: 60,
                                backgroundImage:
                                    NetworkImage('${user.profileUrl}'),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' ${user.name}',
                          style: GoogleFonts.jacquesFrancois(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            //const Color(0xffD3F2EE)
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: screenWidth / 1,
            height: screenHeight * 0.64,
            child: GridView.builder(
              itemCount: Details.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavigationDetails[index],
                          ));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFEADE),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('${Details[index]['img'].toString()}'),
                            Text(
                              Details[index]['title'].toString(),
                              style: GoogleFonts.jacquesFrancois(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
