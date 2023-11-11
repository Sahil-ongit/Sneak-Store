import 'package:flutter/material.dart';

class Privacypage extends StatelessWidget {
  const Privacypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Padding(
                child: Text("Privacy"), padding: EdgeInsets.only(right: 40)
                )
        ),
      ),
    );
  }
}
