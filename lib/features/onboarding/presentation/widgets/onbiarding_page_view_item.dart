import 'package:flutter/material.dart';
import 'package:plaza/core/widgets/separator.dart';

Widget onBoardingPageViewItem(model) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(child: Image(image: AssetImage('${model.image}'))),
    separator(0, 10),
    Text(
      '${model.title}',
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    separator(0, 10),
    Text('${model.body}', style: const TextStyle(fontSize: 20)),
    separator(0, 50),
  ],
);
