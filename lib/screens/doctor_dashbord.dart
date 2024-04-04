import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_appointment_app/screens/generate_report_page.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({Key? key}) : super(key: key);

  @override
  State<DoctorDashboard> createState() => _DoctorDeshbordState();
}

class _DoctorDeshbordState extends State<DoctorDashboard> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    /*
    Text('Home Page'),
    Text('Search Page'),
    Text('Favorites Page'),
    Text('Profile Page'),
*/

    DoctorHomePage(),
    DoctorHomePage(), DoctorHomePage(), DoctorHomePage(),

    //WelcomeScreen(),
    //SignInScreen(),
    //WelcomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenerateReportPage(),
                      ));
                },
                child: Card(
                    color: Color(0xFFFFEADE),
                    child: Container(
                      height: 130,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image:
                                  AssetImage('assets/images/street-view.png')),
                          Text(
                            'View\n appointment',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jacquesFrancois(
                                fontWeight: FontWeight.normal, fontSize: 18

                                //const Color(0xffD3F2EE)
                                ),
                          ),
                        ],
                      ),
                    )),
              ),
              Card(
                  color: Color(0xFFFFEADE),
                  child: Container(
                    height: 130,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/shoes.png')),
                        Text(
                          'Medicine',
                          style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.normal, fontSize: 18

                              //const Color(0xffD3F2EE)
                              ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
/*
          Container(
            width: screenWidth / 1.5,
            height: screenHeight / 4,
            color: Color(0xFFFFEADE),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/street-view.png')),
                    Text(
                      'View appointment',
                      style: GoogleFonts.jacquesFrancois(
                          fontWeight: FontWeight.normal, fontSize: 18

                          //const Color(0xffD3F2EE)
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [

                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/shoes.png')),
                    Text(
                      'Medicine',
                      style: GoogleFonts.jacquesFrancois(
                          fontWeight: FontWeight.normal, fontSize: 18

                        //const Color(0xffD3F2EE)
                      ),
                    ),
                  ],
                )
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
              "Today's Appointments:-",
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {},
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           ScheduleAppointmentPage(),
                                  //     ));
                                },
                                child: Text(
                                  "Accept",
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

///
///

// class ScheduleAppointmentPage extends StatefulWidget {
//   const ScheduleAppointmentPage({Key? key}) : super(key: key);

//   @override
//   State<ScheduleAppointmentPage> createState() =>
//       _ScheduleAppointmentPageState();
// }

// class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
//   String _selectedItem = 'Option 1';
//   String _selectedItemm = 'Option 1';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Text(
//               'Schedule an\n Appointment',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.jacquesFrancois(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,

//                 //const Color(0xffD3F2EE)
//               ),
//             ),
//             //   Tell us about your pet

//             //  undraw_select_re_3kbd 1.png

//             Image(image: AssetImage('assets/images/undraw_select.png')),

//             Text(
//               'Tell us about your pet',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.jacquesFrancois(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,

//                 //const Color(0xffD3F2EE)
//               ),
//             ),

//             CustomTextFeild(title: 'Enter  Pet Name'),

// /*
//             TextField(
//               style: GoogleFonts.jacquesFrancois(
//                 color: Color(0xffD3F2EE),
//                 fontWeight: FontWeight.bold,
//               ),
//               decoration: InputDecoration(
//                   hintText: 'Enter Your Name',
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(21.0),
//                   )),
//             ),

// */
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: Color(0xffD3F2EE),
//                 child: Center(
//                   child: DropdownButton<String>(
//                     value: _selectedItem,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedItem = newValue!;
//                       });
//                     },
//                     items: <String>[
//                       'Option 1',
//                       'Option 2',
//                       'Option 3',
//                       'Option 4'
//                     ].map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: Color(0xffD3F2EE),
//                 child: Center(
//                   child: DropdownButton<String>(
//                     value: _selectedItemm,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedItemm = newValue!;
//                       });
//                     },
//                     items: <String>[
//                       'Option 1',
//                       'Option 2',
//                       'Option 3',
//                       'Option 4'
//                     ].map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),

//             CustomTextFeild(
//               title: 'Enter Breed Name',
//             ),
//             CustomTextFeild(
//               title: 'Age ',
//               myIcon: Icon(Icons.calendar_month),
//             ),

//             /*CustomTextFeild(
//               title: 'Upload Image',
//               myIcon: Icon(Icons.upload_file),
//             ),*/

//             CustomButtom(
//                 title: 'Next...',
//                 voidCallback: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => VetScreen(),
//                       ));
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

// ///
// ///
// ///
// ///
// class CustomTextFeild extends StatelessWidget {
//   CustomTextFeild({
//     required this.title,
//     this.myIcon,
//   });

//   String title;
//   Icon? myIcon;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: title,
//           suffixIcon: myIcon,
//           hintStyle: TextStyle(color: Colors.grey),
//           // Hint text color
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(color: Colors.blue), // Border color
//           ),
//           filled: true,
//           fillColor: Color(0xffD3F2EE), // Background color
//         ),
//         // style: TextStyle(color: Colors.black), // Text color
//         style: GoogleFonts.jacquesFrancois(
//           color: Color(0xffD3F2EE),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
