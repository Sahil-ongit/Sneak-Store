import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log/components/mybutton.dart';
import 'package:log/components/mytextfield.dart';


class Registerpage extends StatefulWidget {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Function()? onTap;
  Registerpage({super.key, required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );


    try {
      if (passwordController.text == confirmpasswordController.text) 
      {
        //create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        //add user details
        addUserDetails(firstnameController.text.trim(),lastnameController.text.trim(), emailController.text.trim());
      } 
      else 
      {
        showerrorMessage("Passwords Do not match");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //show error message
      showerrorMessage(e.code);
    }
  }

  
    Future addUserDetails(
        String firstname, String lastname, String email) async {
        await FirebaseFirestore.instance.collection('users').add({
        'first_name': firstname,
        'last_name': lastname,
        'email': email,
      });
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
                Image.asset(
                  'lib/images/sneak_pic.png',
                  height: 150,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text("Let\'s create an account for  you! ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                const SizedBox(height: 25),
                Mytextfield(
                  controller: firstnameController,
                  hintText: 'First Name',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Mytextfield(
                  controller: lastnameController,
                  hintText: 'Last Name',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                Mytextfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(height: 25),
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login now",
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
