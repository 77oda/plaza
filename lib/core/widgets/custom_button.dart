import 'package:flutter/material.dart';

Widget defaultButton({
  required VoidCallback onTap,
  required String text,
  double? width = double.infinity,
}) => Container(
  height: 40,
  width: width,
  decoration: BoxDecoration(color: Colors.red),
  child: ElevatedButton(
    onPressed: onTap,
    child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17)),
  ),
);
