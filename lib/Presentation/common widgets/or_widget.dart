import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: size * 0.2,
          height: 1,
          color: Colors.grey,
        ),
        const Text(
          'or continue with',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 133, 131, 131),
          ),
        ),
        Container(
          width: size * 0.2,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
