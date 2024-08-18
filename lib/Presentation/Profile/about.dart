import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/constants/constants.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Us',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight10,
            Container(
              margin: EdgeInsets.symmetric(horizontal: size * 0.04),
              height: size * 0.95,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/about.png'),
                      fit: BoxFit.cover)),
            ),
            Text('Who We Are',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ))),
            kheight20,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size * 0.035),
              child: Text(
                textAlign: TextAlign.left,
                'We are a team of healthcare professionals and tech enthusiasts dedicated to improving the way you receive medical care. We believe that quality healthcare should be available to everyone, anytime, and anywhere.',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
              ),
            ),
            kheight20,
            kheight10,
            Text('Who We Do',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ))),
            kheight20,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size * 0.035),
              child: Text(
                textAlign: TextAlign.left,
                'E-Mogram allows you to schedule doctor appointments, have live consultations, and manage your health—all in one place. Our app covers a wide range of medical specialties to ensure you get the care you need, when you need it.',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
              ),
            ),
            kheight20,
            kheight10,
            kheight10,
          ],
        ),
      ),
    );
  }
}
