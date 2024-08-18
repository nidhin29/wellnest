import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Messages/chat.dart';
import 'package:wellnest/Presentation/Messages/messages.dart';
import 'package:wellnest/Presentation/common%20widgets/tips_widget.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    String getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      } else if (hour > 12 && hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size * 0.2),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: maincolor,
            titleSpacing: size * 0.09,
            title: Padding(
              padding: EdgeInsets.only(top: size * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${getGreeting()}👋',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ))),
                  Text('Nidhin V Ninan',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ))),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size * 0.09),
          child: Column(
            children: [
              Text('Upcoming Appointments',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
              kheight20,
              SizedBox(
                height: size * 0.4,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChatPage()));
                        },
                        child: AppointmentTileWidget(
                            size: size - 12,
                            name: 'Dr. John Doe',
                            speciality: 'Cardiologist',
                            date: 'Monday July 13',
                            time: '10:00 AM'),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kwidth10;
                    },
                    itemCount: 5),
              ),
              kheight50,
              Text('Health Tips',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
              kheight20,
              TipsWidget(
                  color: Colors.redAccent,
                  size: size,
                  heading: 'Stay Hydrated',
                  description:
                      'Drink at least 8 glasses of water a day to keep your body hydrated and maintain energy levels'),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Balanced Diet',
                  description:
                      'Incorporate a variety of fruits, vegetables, lean proteins, and whole grains into your diet for optimal nutrition',
                  color: Colors.blueAccent),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Regular Exercise',
                  description:
                      'Aim for at least 30 minutes of moderate exercise, like walking or cycling, most days of the week to improve cardiovascular health',
                  color: Colors.greenAccent),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Proper Sleep',
                  description:
                      'Ensure you get 7-9 hours of quality sleep each night to help your body recover and function effectively',
                  color: Colors.pinkAccent),
              kheight20,
              TipsWidget(
                  size: size,
                  heading: 'Stretching',
                  description:
                      'Start your day with a few minutes of stretching to improve flexibility, reduce muscle tension, and prevent injury',
                  color: Colors.brown),
              kheight20,
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentTileWidget extends StatelessWidget {
  const AppointmentTileWidget({
    super.key,
    required this.size,
    required this.name,
    required this.speciality,
    required this.date,
    required this.time,
  });

  final double size;
  final String name;
  final String speciality;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.8,
      height: size * 0.4,
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: size * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  width: size * 0.13,
                  height: size * 0.13,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      getName(name),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: maincolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ))),
                      Text(
                        speciality,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: size * 0.7,
              height: size * 0.12,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 209, 205, 205)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  const Icon(Icons.access_time),
                  Text(
                    time,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
