import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/common%20widgets/profile_menu_widget.dart';
import 'package:wellnest/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
              title: 'Edit Profile', icon: Icons.person, onPress: () {}),
          ProfileMenuWidget(
              title: 'About Us', icon: Icons.info, onPress: () {}),
          ProfileMenuWidget(
              title: 'Logout', icon: Icons.logout, onPress: () {}),
        ],
      ),
    );
  }
}
