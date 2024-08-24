import 'package:flutter/material.dart';

displaySnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style:const TextStyle(fontSize: 20),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}