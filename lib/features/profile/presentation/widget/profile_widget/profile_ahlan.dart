import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAhlan extends StatelessWidget {
  const ProfileAhlan({super.key, required this.name, required this.email});
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ahlan ${name.split(' ').elementAt(0)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(email, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
