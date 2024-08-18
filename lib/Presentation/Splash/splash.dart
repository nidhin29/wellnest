import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Splash/intro.dart';
import 'package:wellnest/Presentation/constants/constants.dart';
import 'package:wellnest/Presentation/constants/loading.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const IntroPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          kheight50,
          kheight20,
          Text('E-MOGRAM',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ))),
          kheight20,
          spinkit,
        ],
      ),
    );
  }
}
