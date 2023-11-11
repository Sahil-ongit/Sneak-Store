import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drawerpage extends StatefulWidget {
  const Drawerpage({super.key});

  @override
  State<Drawerpage> createState() => _DrawerpageState();
}

class _DrawerpageState extends State<Drawerpage> {

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            DrawerHeader(
                child: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
              size: 64,
            )),
            Text(
              "Welcome " +user.email! +" ! ",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, 'profile_page'),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text(
                "Favourite",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, 'favourite_page'),
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.white,
              ),
              title: Text(
                "Privacy policy",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, 'privacy_page'),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Text(
                "About",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, 'about_page'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushNamed(context, 'settings_page'),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => signUserOut(),
            )
          ],
        ));
  }
}
