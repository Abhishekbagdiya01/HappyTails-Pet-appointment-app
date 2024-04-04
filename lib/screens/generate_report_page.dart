import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/screens/medicine_report_page.dart';

class GenerateReportPage extends StatefulWidget {
  // const GenrateReportPage({super.key});

  @override
  State<GenerateReportPage> createState() => _GenerateReportPageState();
}

class _GenerateReportPageState extends State<GenerateReportPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;

    List detailsOfPet = [
      {
        'Pet Name': 'Charlie',
        'Category': 'Dog',
        'Date': '08-jan-2024',
        'Time': '2:30 PM'
      },
      {
        'Pet Name': 'Janny',
        'Category': 'Cat',
        'Date': '10-jan-2024',
        'Time': '4:30 PM'
      },
      {
        'Pet Name': 'Olly',
        'Category': 'Rabbit',
        'Date': '18-jan-2024',
        'Time': '9:30 PM'
      },
      {
        'Pet Name': 'Maya',
        'Category': 'Cow',
        'Date': '28-jan-2024',
        'Time': '7:30 PM'
      },
      {
        'Pet Name': 'Charlie',
        'Category': 'Dog',
        'Date': '08-jan-2024',
        'Time': '2:30 PM'
      },
      {
        'Pet Name': 'Janny',
        'Category': 'Cat',
        'Date': '10-jan-2024',
        'Time': '4:30 PM'
      },
      {
        'Pet Name': 'Olly',
        'Category': 'Rabbit',
        'Date': '18-jan-2024',
        'Time': '9:30 PM'
      },
      {
        'Pet Name': 'Maya',
        'Category': 'Cow',
        'Date': '28-jan-2024',
        'Time': '7:30 PM'
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBCF4DC),
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            screenHeight / 5,
          ),
          child: Container(
            width: screenWidth / 1,
            height: screenHeight / 5,
            color: Color(0xffBCF4DC),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 60,
                    backgroundImage:
                        AssetImage('assets/images/Salina_Zaman.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' Welcome Doctor Sumit',
                    style: GoogleFonts.jacquesFrancois(
                      fontWeight: FontWeight.normal,
                      //const Color(0xffD3F2EE)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight / 30,
          ),
          /*Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: SearchBar(),
          ),*/
          /*Container(
            width: screenWidth / 2,
            height: screenHeight / 4,
            color: Color(0xFFFFEADE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/street-view.png')),
                Text(
                  'View appointment',
                  style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.normal,
                    //const Color(0xffD3F2EE)
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/shoes.png')),
                Text(
                  'Medicine',
                  style: GoogleFonts.jacquesFrancois(
                    fontWeight: FontWeight.normal,
                    //const Color(0xffD3F2EE)
                  ),
                ),
              ],
            ),
          ),*/
          Container(
            width: screenWidth / 100,
            height: screenHeight / 100,
          ),
          Container(
            width: screenWidth / 1.05,
            height: screenHeight / 20,
            //color: Colors.red,
            child: Text(
              "Completed Appointment:-",
              style: GoogleFonts.jacquesFrancois(
                  fontWeight: FontWeight.normal, fontSize: 24

                  //const Color(0xffD3F2EE)
                  ),
            ),
          ),
          Expanded(
            /*
            width: screenWidth / 1.05,
            height: screenHeight / 4.5,
            color: Colors.red,*/
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: detailsOfPet.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffBCF4DC)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Pet Name : ${detailsOfPet[index]['Pet Name'].toString()}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              'Category : ${detailsOfPet[index]['Category'].toString()}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Date : ${detailsOfPet[index]['Date'].toString()}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              'Time : ${detailsOfPet[index]['Time'].toString()}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MedicineReportPage(),
                                      ));
                                },
                                child: Text(
                                  "Generate Report",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
