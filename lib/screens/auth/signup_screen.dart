import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(
                  tag: 'logo',
                  child: Icon(Icons.library_music, color: Colors.green, size: 100),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 40),
                
                _buildTextField(hint: 'Username'),
                const SizedBox(height: 20),
                
                _buildTextField(hint: 'Email'),
                const SizedBox(height: 20),
                
                _buildTextField(hint: 'Password', isPassword: true),
                const SizedBox(height: 30),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  onPressed: () {
                    // 1. Show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Account created successfully! Please log in.'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // 2. Redirect to Login instead of Home
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up', 
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                ),
                
                const SizedBox(height: 20),
                
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (_) => const LoginScreen())
                  ),
                  child: const Text(
                    "Already have an account? Log In",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), 
          borderSide: BorderSide.none
        ),
      ),
    );
  }
}