import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/Messages/chat.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Messages',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kheight10,
            Padding(
              padding: EdgeInsets.only(left: size * 0.05),
              child: Text('Recent Chat',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ))),
            ),
            kheight20,
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChatPage(),
                      ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: maincolor,
                        child: Text(
                          getName('Dr. John Doe'),
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      title: Text('Dr. John Doe',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ))),
                      subtitle: Text('Hey, how are you?',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ))),
                      trailing: Text('10:30 AM',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ))),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: size * 0.05, right: size * 0.05),
                    child: const Divider(),
                  );
                },
                itemCount: 10)
          ],
        ),
      ),
    );
  }
}

String getName(String name) {
  for (int i = 0; i < name.length; i++) {
    if (name[i] == ' ') {
      return name[i + 1];
    }
  }
  return 'D';
}
