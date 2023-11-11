import 'package:flutter/material.dart';

class Favouritepage extends StatefulWidget {
  const Favouritepage({super.key});

  @override
  State<Favouritepage> createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Padding(
                child: Text("Favourite"), padding: EdgeInsets.only(right: 40)
                )
        ),
      ),
     
    );
  }
}
