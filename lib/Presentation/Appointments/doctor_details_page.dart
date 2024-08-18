import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Appointments/appointment.dart';
import 'package:wellnest/Presentation/Messages/messages.dart';
import 'package:wellnest/Presentation/common%20widgets/doctor_info.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details',
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: size * 0.2,
            backgroundColor: maincolor,
            child: Text(
              getName('Dr. John Doe'),
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Column(
            children: [
              Text(
                "Dr John Doe",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(
                width: size * 0.8,
                child: Text(
                  'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians, United Kingdom)',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 112, 111, 111),
                    fontSize: 15,
                  )),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            width: size * 0.8,
            child: Text(
              'Sarawak General Hospital',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size * 0.03),
            child: const DoctorInfo(patients: 109, exp: 10),
          ),
          Column(
            children: [
              Text(
                'About Doctor',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                )),
              ),
              kheight10,
              SizedBox(
                width: size * 0.9,
                child: Text(
                  'Dr John Doe is an experienced Specialist at Sarawak, graduated since 2008, and completed his/her training at Sungai Buloh General Hospital.',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 112, 111, 111),
                    fontSize: 15,
                  )),
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AppointmentPage(),
              ));
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
              'Book Appointment',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
