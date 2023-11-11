import 'package:flutter/material.dart';

class Settings_page extends StatelessWidget {
  const Settings_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          backgroundColor: Colors.black,
        title: Center(
            child: Padding(
                child: Text("Settings"), padding: EdgeInsets.only(right: 40)
                )
        ),
      ),
    );
  }
}
