import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 60),

              // ── Logo ──────────────────────────────────
              Image.asset("assets/jumia_logo.png", width: 200),

              // ── Full Name ─────────────────────────────
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Full Name",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text("Full Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // ── Email ─────────────────────────────────
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Email",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text("Email Address"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // ── Phone Number ──────────────────────────
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Phone Number",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text("Phone Number"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // ── Password ──────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Password",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hint: Text("PIN or Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // ── Confirm Password ──────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Password",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hint: Text("Re-enter Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // ── Sign Up Button ────────────────────────
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                onTap: () {
                  Get.offAndToNamed("/homescreen");
                },
              ),

              // ── Already have an account ───────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 30.0, 0),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      child: Text(
                        "Log In",
                        style: TextStyle(color: primaryColor, fontSize: 18),
                      ),
                      onTap: () {
                        Get.toNamed("/");
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}