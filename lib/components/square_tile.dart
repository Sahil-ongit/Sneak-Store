import 'package:flutter/material.dart';

class Squaretile extends StatelessWidget {
  final String imagepath;

  const Squaretile({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200]),
      child: Image.asset(
        imagepath,
        height: 40,
      ),
    );
  }
}
