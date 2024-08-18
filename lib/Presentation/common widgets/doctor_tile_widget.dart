import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest/Presentation/constants/constants.dart';


class DoctorTileWidget extends StatelessWidget {
  const DoctorTileWidget({
    super.key,
    required this.size,
    required this.rating, required this.name, required this.designation, required this.imageUrl,
  });

  final double size;
  final int rating;
  final String name;
  final String designation;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 0.55,
      width: size * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size * 0.4,
            width: size * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size * 0.12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size * 0.07,
                  width: size * 0.44,
                  decoration: BoxDecoration(
                    color: maincolor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      kwidth5,
                      const Icon(Icons.check_circle,
                          color: Colors.white, size: 16),
                      kwidth5,
                      Text('Professional Doctor',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ))),
                    ],
                  ),
                ),
                kheight5,
                Text(name,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ))),
                Text(designation,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ))),
                kheight10,
                Row(
                  children: [
                    for (var i = 0; i < rating; i++)
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                    ...List.generate(
                        5 - rating,
                        (index) => const Icon(Icons.star,
                            color: Colors.grey, size: 16)),
                    kwidth5,
                    Text(rating.toString(),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ))),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
