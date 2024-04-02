import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDashbordPage extends StatefulWidget {
  const UserDashbordPage({super.key});

  @override
  State<UserDashbordPage> createState() => _UserDashbordPageState();
}

class _UserDashbordPageState extends State<UserDashbordPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: screenWidth / 1,
              height: screenHeight / 4,
              color: Color(0xffBCF4DC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/monit.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' Good day, Manit ',
                      style: GoogleFonts.jacquesFrancois(
                        fontWeight: FontWeight.normal,
                        //const Color(0xffD3F2EE)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 30,
            ),
            SizedBox(
              height: screenHeight / 10,
            ),
            Container(
              width: screenWidth / 1.5,
              height: screenHeight / 3,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/box.png')),
                          Text(
                            'Veterinary',
                            style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/food.png')),
                          Text(
                            'Food',
                            style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/shoes.png')),
                          Text(
                            'Medicine',
                            style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/flag.png')),
                          Text(
                            'Training',
                            style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/others.png')),
                          Text(
                            'others',
                            style: GoogleFonts.jacquesFrancois(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
