import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductFreeDelivery extends StatelessWidget {
  const ProductFreeDelivery({super.key});

  String getDateTomorrow() {
    DateTime dateTime = DateTime.now().add(Duration(days: 1));
    String date = DateFormat.yMMMd().format(dateTime);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'FREE delivery by ',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Text(getDateTomorrow()),
      ],
    );
  }
}
