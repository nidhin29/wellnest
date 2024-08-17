import 'package:flutter/material.dart';
import 'package:wellnest/constants/constants.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.patients, required this.exp});

  final int patients;
  final int exp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InfoCard(
          label: 'Patients',
          value: '$patients',
        ),
        kwidth10,
        kwidth5,
        InfoCard(
          label: 'Experience',
          value: '$exp years',
        ),
        kwidth10,
        kwidth5,
        const InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: maincolor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            kheight10,
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
