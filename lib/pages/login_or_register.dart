import 'package:flutter/material.dart';
import 'package:log/pages/login_page.dart';
import 'package:log/pages/register_page.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLoginPage = true;

  void tooglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(
        onTap: tooglePage,
      );
    } else {
      return Registerpage(
        onTap: tooglePage,
      );
    }
  }
}
