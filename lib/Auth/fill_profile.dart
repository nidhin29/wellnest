import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Home/mainscreen.dart';
import 'package:wellnest/constants/constants.dart';

class FillProfilePage extends StatelessWidget {
  FillProfilePage({super.key});
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final ValueNotifier<String?> gender = ValueNotifier<String?>(null);
  final facebookController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Fill Your Profile',
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 213, 212, 216),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 220, 217, 217),
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(size * 0.04)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 220, 217, 217),
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(size * 0.04)),
                    ),
                    hintText: 'Full Name',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(122, 120, 120, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              kheight20,
              Padding(
                padding: EdgeInsets.only(right: size * 0.75, left: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 213, 212, 216),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 220, 217, 217),
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(size * 0.04)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 220, 217, 217),
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(size * 0.04)),
                    ),
                    hintText: 'Age',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(122, 120, 120, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              kheight20,
              Padding(
                padding: EdgeInsets.only(right: size * 0.65, left: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 213, 212, 216),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 217, 217),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(size * 0.04)),
                      ),
                      hintText: 'Weight',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixText: 'kg',
                      suffixStyle: const TextStyle(
                        color: Color.fromRGBO(122, 120, 120, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              kheight20,
              ValueListenableBuilder(
                valueListenable: gender,
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15, right: size * 0.65),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 213, 212, 216),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 220, 217, 217),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(size * 0.04)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 220, 217, 217),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(size * 0.04)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(size * 0.04)),
                          )),
                      hint: const Text(
                        'Gender',
                        style: TextStyle(
                          color: Color.fromRGBO(122, 120, 120, 1),
                        ),
                      ),
                      value: value,
                      items: const [
                        DropdownMenuItem(
                            value: 'Male',
                            child: Text(
                              'Male',
                              style: TextStyle(
                                  color: Color.fromRGBO(122, 120, 120, 1)),
                            )),
                        DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female',
                                style: TextStyle(
                                    color: Color.fromRGBO(122, 120, 120, 1)))),
                      ],
                      onChanged: (value) {
                        gender.value = value.toString();
                      },
                    ),
                  );
                },
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: facebookController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 213, 212, 216),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 220, 217, 217),
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(size * 0.04)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 220, 217, 217),
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(size * 0.04)),
                    ),
                    hintText: 'Facebook API Key',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(122, 120, 120, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => MainScreenPage(),
                ),
                (route) => false,
              );
            },
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(maincolor),
              minimumSize:
                  WidgetStateProperty.all(Size(size * 0.8, size * 0.15)),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
