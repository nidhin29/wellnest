import 'package:flutter/material.dart';

class MultipleColumnText extends StatelessWidget {
  final String text;
  final String text1;
  final double width;
  const MultipleColumnText({
    super.key,
    required this.size1,
    required this.text,
    required this.text1,
    required this.width,
  });

  final double size1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,
            style:
                TextStyle(fontSize: size1 * 0.04, fontWeight: FontWeight.w500)),
        SizedBox(
          width: width,
        ),
        Text(text1,
            style:
                TextStyle(fontSize: size1 * 0.04, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
