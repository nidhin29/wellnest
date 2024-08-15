import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsWidget extends StatelessWidget {
  const TipsWidget({
    super.key,
    required this.size,
    required this.heading,
    required this.description,
    required this.color,
  });

  final double size;
  final String heading;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.8,
      height: size * 0.33,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(heading,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ))),
          Padding(
            padding: EdgeInsets.only(left: size * 0.05, right: size * 0.05),
            child: Text(description,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ))),
          ),
        ],
      ),
    );
  }
}
