import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Application/profile/profile_cubit.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Profile/profile_model.dart';
import 'package:wellnest/Presentation/Home/mainscreen.dart';
import 'package:wellnest/Presentation/common%20widgets/snackbar.dart';
import 'package:wellnest/Presentation/constants/constants.dart';
import 'package:wellnest/Presentation/constants/loading.dart';

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
      ),
      body:
          BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
        state.isFailureOrSuccessForUpdate.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (!state.isLoading) {
                if (failure == const MainFailure.serverFailure()) {
                  displaySnackBar(context: context, text: "Server is down");
                } else if (failure == const MainFailure.clientFailure()) {
                  displaySnackBar(
                      context: context,
                      text: "Something wrong with your network");
                } else {
                  displaySnackBar(
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MainScreenPage(),
                ),
                (route) => false,
              );
            },
          ),
        );
      }, builder: (context, state) {
        if( state.isLoading){
          return const Center(child: spinkit);
        }
        return Column(
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
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size * 0.04)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 220, 217, 217),
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size * 0.04)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size * 0.04)),
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
                                      color:
                                          Color.fromRGBO(122, 120, 120, 1)))),
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
                if (nameController.text.isEmpty ||
                    ageController.text.isEmpty ||
                    weightController.text.isEmpty ||
                    facebookController.text.isEmpty ||
                    gender.value == null) {
                  displaySnackBar(
                      context: context, text: 'Please fill all the fields');
                } else {
                  BlocProvider.of<ProfileCubit>(context).updateProfile(
                      profileModel: ProfileModel(gender.value!,
                          age: int.parse(ageController.text),
                          facebookApi: facebookController.text,
                          weightAddress: weightController.text,
                          name: nameController.text));
                }
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
        );
      }),
    );
  }
}
