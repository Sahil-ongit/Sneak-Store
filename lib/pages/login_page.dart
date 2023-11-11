import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log/components/mybutton.dart';
import 'package:log/components/mytextfield.dart';

class Loginpage extends StatefulWidget {
  Function()? onTap;
  Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
    }
     on FirebaseAuthException catch (e) 
     {
      Navigator.pop(context);
      //show error message
      showerrorMessage(e.code);
    }
  }

  void showerrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(message)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
               Image.asset('lib/images/sneak_pic.png',height: 150,),
                const SizedBox(
                  height: 15,
                ),
                Text("Welcome back you\'ve been missed! ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                const SizedBox(height: 25),
                Mytextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Mytextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text("Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                        ),
                        onTap:()=>Navigator.pushNamed(context, 'forgotPassword_page'),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                MyButton(
                  text: "Sign In",
                  onTap: signUserIn,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Register now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
