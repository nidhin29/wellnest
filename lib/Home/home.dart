import 'package:flutter/material.dart';
import 'package:wellnest/Auth/signin.dart';
import 'package:wellnest/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          kheight10,
          Container(
            margin: EdgeInsets.symmetric(horizontal: size * 0.04),
            height: size * 0.95,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imgs/OQ6UTW0.jpg'),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              Text('Welcome to\n E-MOGRAM! 👋',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size * 0.09,
                      fontWeight: FontWeight.bold,
                      color: maincolor)),
              kheight20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * 0.04),
                child: Text(
                  textAlign: TextAlign.center,
                  'The ultimate platform for seamless and expert doctor appointments,revolutionizing healthcare and wellness for the modern age!',
                  style: TextStyle(
                      fontSize: size * 0.04,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 56, 54, 54)),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
            },
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(maincolor),
              minimumSize:
                  WidgetStateProperty.all(Size(size * 0.8, size * 0.15)),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          kheight5,
        ],
      ),
    );
  }
}
