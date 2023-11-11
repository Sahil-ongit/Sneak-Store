import 'package:flutter/material.dart';
import 'package:log/category_pages/adidas_page.dart';
import 'package:log/category_pages/nike_page.dart';
import 'package:log/category_pages/puma_page.dart';
import 'package:log/category_pages/vans_page.dart';
import 'package:log/components/cartpage.dart';
import 'package:log/drawer_pages/about_page.dart';
import 'package:log/drawer_pages/privacy_page.dart';
import 'package:log/drawer_pages/settings_page.dart';
import 'package:log/models/cart.dart';
import 'package:log/pages/auth_page.dart';
import 'package:log/drawer_pages/favourite_page.dart';
import 'package:log/pages/details_page.dart';
import 'package:log/pages/forgot_password_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:log/drawer_pages/profile_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
        routes: {
          'profile_page': (context) => Profilepage(),
          'favourite_page': (context) => Favouritepage(),
          'privacy_page': (context) => Privacypage(),
          'settings_page': (context) => Settings_page(),
          'about_page': (context) => About_page(),
          'forgotPassword_page': (context) => forgotPassword(),
          'nikepage':(context) => NikePage(),
          'pumapage':(context) => PumaPage(),
          'adidaspage':(context) => AdidasPage(),
          'cartpage':(context) => CartPage(),
          'vanspage':(context) => VansPage(),
          'detailspage':(context) => DetailsPage()
        },
      ),
    );
  }
}
