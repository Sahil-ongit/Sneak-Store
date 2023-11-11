import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log/components/drawer.dart';
import 'package:log/screens/screen_1.dart';
import 'package:log/screens/screen_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myindex = 0;
  List<Widget> ListWidget = [
    Screen1(),
    Screen2(),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawerpage(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Sneak Store", style: GoogleFonts.jost())),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cartpage');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(child: ListWidget[myindex]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.category, size: 30),
        ],
        index: myindex,
        onTap: (index) {
          setState(() {
            myindex = index;
            print(myindex);
          });
          //Handle button tap
        },
      ),
    );
  }
}
