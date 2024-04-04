import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  //const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List details = [
    {'img': 'assets/images/profile_icon.png', 'title': 'Profile'},
    {'img': 'assets/images/fav.png', 'title': 'Favorite'},
    {'img': 'assets/images/wallet.png', 'title': 'Payment Method'},
    {'img': 'assets/images/lock.png', 'title': 'Privacy Policy'},
    {'img': 'assets/images/setting.png', 'title': 'Settings'},
    {'img': 'assets/images/help.png', 'title': 'Help'},
    {'img': 'assets/images/logout.png', 'title': 'Logout'},
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
        centerTitle: true,
        title: Text(
          'My Profile',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2260FF)),
        ),
      ),
      body: Container(
        //color: Color(0xffBCF4DC),
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
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/Salina_Zaman.png'),
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
                      "Jhon",
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
                height: screenHeight/2,
                //color: Colors.red,
                child: ListView.builder(itemCount: details.length,itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading:Image.asset(details[index]['img'].toString()),
                      title: Text(details[index]['title'].toString()),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  );
                  },),
              ),/*
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('About Us'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.call),
                  title: Text('Contact Us'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
