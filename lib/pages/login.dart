import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/pages/bottomNav.dart';
import 'package:foodgo/pages/singup.dart';
import 'package:foodgo/service/Widget_supoort.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    if (mailController.text.isEmpty || passwordController.text.isEmpty) {
      AppWidget.snackbarMsg(context, Colors.red, "All fields are required!");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text.trim(),
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottomnav()),
      );
    } on FirebaseAuthException catch (e) {
      log("Login Error: ${e.message}");
      if (e.code == "user-not-found") {
        AppWidget.snackbarMsg(context, Colors.red, "No user found with this email");
      } else if (e.code == "wrong-password") {
        AppWidget.snackbarMsg(context, Colors.red, "Incorrect password");
      } else if (e.code == "invalid-email") {
        AppWidget.snackbarMsg(context, Colors.red, "Invalid email format");
      } else {
        AppWidget.snackbarMsg(context, Colors.red, "Login failed. Try again.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Section with Logo
          Container(
            height: MediaQuery.of(context).size.height / 3,
            padding: const EdgeInsets.only(top: 20.0),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffefbf),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Image.asset('images/pan.png', height: 180, width: 240, fit: BoxFit.fill),
                Image.asset('images/logo.png', width: 150, height: 50, fit: BoxFit.cover),
              ],
            ),
          ),

          // Login Form
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3.2,
              left: 20,
              right: 20,
            ),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.65,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(child: Text("Log In", style: AppWidget.HeadlineTetFeildstyle())),
                    const SizedBox(height: 30),

                    // Email Field
                    Text("Email", style: AppWidget.SignupTextFeildStyle()),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: mailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    Text("Password", style: AppWidget.SignupTextFeildStyle()),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true, // Hides the password
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password?", style: AppWidget.sImpleTetFeildstyle()),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Login Button
                    GestureDetector(
                      onTap: userLogin,
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xffef2b39),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text("Log In", style: AppWidget.boldWhitetextFeildStyle()),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Signup Redirect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: AppWidget.sImpleTetFeildstyle()),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Singup()),
                            );
                          },
                          child: Text("Sign Up", style: AppWidget.boldtextfeildStyle()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
