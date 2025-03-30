import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String text,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: color,
      content: Text(text, textAlign: TextAlign.center),
    ),
  );
}
