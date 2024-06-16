import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/screens/training_details_page.dart';
import 'package:pet_appointment_app/utils/snackbar.dart';
import 'package:pet_appointment_app/widgets/custom_clip.dart';
import 'package:pet_appointment_app/widgets/custom_textfeild.dart';

class TrainingPage extends StatefulWidget {
  //const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  List imageDetails = [
    'assets/images/dog_pet.png',
    'assets/images/cat_pet.png',
    'assets/images/cow_pet.png',
    'assets/images/rabbit_pet.png',
    'assets/images/bird_.png',
    'assets/images/fish.png',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 200,
        flexibleSpace: ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffBCF4DC),
            child: Center(
              child: Text(
                "Training &\nExercises",
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Choose Your Pet Category ',
                textAlign: TextAlign.center,
                style: GoogleFonts.jacquesFrancois(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                  //const Color(0xffD3F2EE)
                ),
              ),
            ),
            Container(
              width: screenWidth / 1,
              height: screenHeight / 1.65,
              decoration: BoxDecoration(
                  color: Color(0xFFFFEADE),
                  borderRadius: BorderRadius.circular(21)),
              child: GridView.builder(
                itemCount: imageDetails.length,
                // Replace with your data source length
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 0.0, // spacing between items
                  mainAxisSpacing: 0.0, // spacing between rows
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (imageDetails[index] == 'assets/images/dog_pet.png') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingDetailsPage(),
                            ));
                      } else {
                        snackbarMessenger(context, "Coming soon !!!");
                      }
                    },
                    child: Image(
                        image: AssetImage(imageDetails[index].toString())),
                  );
                  // Replace with your grid item widget
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
