import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wellnest/Presentation/Home/mainscreen.dart';
import 'package:wellnest/Presentation/constants/constants.dart';


class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset('assets/success.json'),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Successfully Booked',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size * 0.1),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MainScreenPage()),
                    (route) => false);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: const WidgetStatePropertyAll(maincolor),
                minimumSize:
                    WidgetStateProperty.all(Size(size * 0.92, size * 0.15)),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
