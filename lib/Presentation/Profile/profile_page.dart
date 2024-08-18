import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Auth/signin.dart';
import 'package:wellnest/Presentation/Profile/about.dart';
import 'package:wellnest/Presentation/Profile/edit_profile.dart';
import 'package:wellnest/Presentation/common%20widgets/profile_menu_widget.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('My Profile',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
      ),
      body: Column(
        children: [
          kheight50,
          Text('Nidhin V Ninan',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ))),
          kheight50,
          ProfileMenuWidget(
              title: 'Edit Profile',
              icon: Icons.person,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ));
              }),
          ProfileMenuWidget(
              title: 'About Us',
              icon: Icons.info,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ));
              }),
          ProfileMenuWidget(
              title: 'Logout',
              icon: Icons.logout,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              }),
        ],
      ),
    );
  }
}
