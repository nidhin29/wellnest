import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Appointments/doctor_details_page.dart';
import 'package:wellnest/Presentation/common%20widgets/doctor_tile_widget.dart';
import 'package:wellnest/Presentation/constants/constants.dart';


class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    const rating = 4;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Schedule',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Available Doctors',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ))),
            ListView.separated(
              separatorBuilder: (context, index) => kheight20,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(size * 0.06),
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: DoctorTileWidget(
                    size: size,
                    rating: rating,
                    name: 'Dr John Doe',
                    designation: 'General Practitioner',
                    imageUrl: 'assets/imgs/doctor.webp',
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DoctorDetailsPage(),
                  )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
