import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/customButton/custom_button.dart';
import 'package:pet_appointment_app/models/meet_up_model.dart';
import 'package:pet_appointment_app/repository/user_repository/user_repository.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';

import '../widgets/custom_clip.dart';
import '../widgets/custom_textfeild.dart';

class SocializationScreen extends StatefulWidget {
  const SocializationScreen({super.key});

  @override
  State<SocializationScreen> createState() => _SocializationPageState();
}

class _SocializationPageState extends State<SocializationScreen> {
  @override
  Widget build(BuildContext context) {
    List details = [
      {
        'title': 'Meetups',
        'titleOne': 'Create&Invite',
        'titleTwo': '',
        'titleThree': 'Participate'
      },
      {
        'title': 'Happy to Help',
        'titleOne': '',
        'titleTwo': ' FAQ',
        'titleThree': ''
      },
    ];

    // List navigateDetails=[
    //MeetUpDetailsPage();
    //  FAQPage(),
    // ];

    List boxColor = [
      Color(0xffFF9595),
      Color(0xffB533A8),
    ];

    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 200,
          flexibleSpace: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffBCF4DC),
              child: Center(
                child: Text(
                  "Socialization",
                  style: customTextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '  For your Happy life, develop a healthy community.',
                textAlign: TextAlign.start,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: screenWidth / 1,
                height: screenHeight / 3.5,
                child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MeetUpDetailsPage();
                            },
                          ));
                        },
                        child: Container(
                          width: screenWidth / 1,
                          height: screenHeight / 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: boxColor[index],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(details[index]['title'],
                                      style: GoogleFonts.jacquesFrancois(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(details[index]['titleOne'],
                                      style: GoogleFonts.jacquesFrancois(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16)),
                                  Text(details[index]['titleTwo'],
                                      style: GoogleFonts.jacquesFrancois(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16)),
                                  Text(details[index]['titleThree'],
                                      style: GoogleFonts.jacquesFrancois(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Image.asset('assets/images/peoples.png'),
            ],
          ),
        ));
  }
}

///
///

class MeetUpPage extends StatefulWidget {
  const MeetUpPage({super.key});

  @override
  State<MeetUpPage> createState() => _MeetUpPageState();
}

class _MeetUpPageState extends State<MeetUpPage> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    final double screenHeight = screenSize.height;

    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Meet UP',
          textAlign: TextAlign.center,
          style: GoogleFonts.jacquesFrancois(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFeild(
              controller: titleController,
              title: 'Title',
            ),
            CustomTextFeild(
              controller: descController,
              title: 'Description',
            ),
            CustomTextFeild(
              controller: timeController,
              title: 'Date & Time',
            ),
            CustomTextFeild(
              controller: locationController,
              title: 'Location',
            ),
            SizedBox(
              height: screenHeight / 3,
            ),
            CustomButton(
                title: 'Post',
                voidCallback: () async {
                  if (titleController.text.trim().isNotEmpty &&
                      descController.text.trim().isNotEmpty &&
                      timeController.text.trim().isNotEmpty &&
                      locationController.text.trim().isNotEmpty) {
                    MeetUpsModel meetUpsModel = MeetUpsModel(
                        uid: uid,
                        title: titleController.text,
                        details: descController.text,
                        dateTime: timeController.text,
                        location: locationController.text,
                        participients: []);

                    String response = await UserRepository()
                        .createMeetUps(meetUpsModel: meetUpsModel);
                    if (response == "Meet-up created") {
                      snackbarMessenger(context, response);
                    } else {
                      snackbarMessenger(context, response);
                    }
                  } else {
                    snackbarMessenger(context, "Field cannot be empty");
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeetUpDetailsPage(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}

class MeetUpDetailsPage extends StatefulWidget {
  const MeetUpDetailsPage({super.key});

  @override
  State<MeetUpDetailsPage> createState() => _MeetUpDetailsPageState();
}

class _MeetUpDetailsPageState extends State<MeetUpDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meetup Details')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MeetUpPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: UserRepository().getAllMeetUps(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MeetUpsModel> meetUp = snapshot.data!;

            return meetUp.length == 0
                ? Center(
                    child: Text("No meetups are there press + to create one"))
                : ListView.builder(
                    itemCount: meetUp.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1,
                        color: Color(0xFFBCF4DC),
                        child: ListTile(
                          title: Text(
                            meetUp[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          subtitle: Text(
                              "${meetUp[index].details} \n DATE & Time ${meetUp[index].dateTime} \n Location : ${meetUp[index].location}"),
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
    );
  }
}
