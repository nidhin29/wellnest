import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wellnest/Application/profile/profile_cubit.dart';
import 'package:wellnest/Presentation/Auth/signin.dart';
import 'package:wellnest/Presentation/Profile/about.dart';
import 'package:wellnest/Presentation/Profile/edit_profile.dart';
import 'package:wellnest/Presentation/common%20widgets/profile_menu_widget.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProfileCubit>(context).getProfile();
    });
    final size = MediaQuery.of(context).size.width;
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
          kheight20,
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 0, 0, 0),
                      highlightColor: const Color.fromARGB(255, 207, 207, 207),
                      child: Container(
                        width: size * 0.4,
                        height: size * 0.4,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(34, 0, 0, 0),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    kheight10,
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 0, 0, 0),
                      highlightColor: const Color.fromARGB(255, 207, 207, 207),
                      child: Container(
                        width: size * 0.4,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(34, 0, 0, 0),
                        ),
                      ),
                    ),
                    kheight10,
                    Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 0, 0, 0),
                      highlightColor: const Color.fromARGB(255, 207, 207, 207),
                      child: Container(
                        width: size * 0.5,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(34, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                );
              }
              state.isFailureOrSuccessForGet.fold(() {
                return Container(
                  width: double.infinity,
                  height: size * 0.6,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/imgs/noData.png'))),
                );
              }, (either) {
                either.fold((l) {
                  return Container(
                    width: double.infinity,
                    height: size * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/imgs/noData.png'))),
                  );
                }, (r) {
                  state.profileModel == null
                      ? Container(
                          width: double.infinity,
                          height: size * 0.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/imgs/noData.png'))),
                        )
                      : Column(
                          children: [
                            Container(
                              width: size * 0.4,
                              height: size * 0.4,
                              decoration: const BoxDecoration(
                                color: maincolor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  r.name == '' ? '' : r.name[0].toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: size * 0.2,
                                    fontWeight: FontWeight.w600,
                                  )),
                                ),
                              ),
                            ),
                            kheight20,
                            Text(r.name,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ))),
                            Text(r.email!,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ))),
                          ],
                        );
                });
              });
              return Container(
                width: double.infinity,
                height: size * 0.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/imgs/noData.png'))),
              );
            },
          ),
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
                BlocProvider.of<ProfileCubit>(context).deleteEmail();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              }),
        ],
      ),
    );
  }
}
