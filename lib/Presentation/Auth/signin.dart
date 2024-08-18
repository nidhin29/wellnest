import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Auth/signup.dart';
import 'package:wellnest/Presentation/Home/mainscreen.dart';
import 'package:wellnest/Presentation/common%20widgets/or_widget.dart';
import 'package:wellnest/Presentation/constants/constants.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final ValueNotifier<bool> obtext = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    void passwordfunction() {
      obtext.value = !obtext.value;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          kheight5,
          Container(
            width: double.infinity,
            height: size * 0.8,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imgs/login.png'),
                    fit: BoxFit.cover)),
          ),
          Text('Login to Your Account',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Colors.black,
                fontSize: size * 0.07,
                fontWeight: FontWeight.w600,
              ))),
          kheight5,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 183, 179, 179),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(size * 0.04)),
                ),
                prefixIcon: const Icon(Icons.email,
                    color: Color.fromRGBO(69, 69, 69, 1)),
                hintText: 'Email',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(69, 69, 69, 1),
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          kheight5,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ValueListenableBuilder(
                valueListenable: obtext,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: !value,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 183, 179, 179),
                      suffixIcon: IconButton(
                        onPressed: () {
                          passwordfunction();
                        },
                        icon: Icon(
                            value ? Icons.visibility : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      prefixIcon: const Icon(Icons.lock,
                          color: Color.fromRGBO(69, 69, 69, 1)),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(69, 69, 69, 1),
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              )),
          kheight5,
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MainScreenPage(),
              ));
            },
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(maincolor),
              minimumSize:
                  WidgetStateProperty.all(Size(size * 0.8, size * 0.15)),
            ),
            child: const Text(
              'Sign in',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          kheight5,
          const OrWidget(),
          kheight5,
          Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/Vector.png'))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size * 0.18),
            child: Row(
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: maincolor),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
