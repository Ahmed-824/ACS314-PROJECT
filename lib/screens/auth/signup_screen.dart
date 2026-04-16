import 'package:flutter/material.dart';
import 'login_screen.dart'; 
import '../../services/api_service.dart'; // Import your service

class SignUpScreen extends StatefulWidget { // Changed to StatefulWidget to use controllers
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // 1. Create controllers to grab the text
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleSignUp() async {
    setState(() => _isLoading = true);

    // 2. Call the API Service
    final result = await ApiService.signUp(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );

    setState(() => _isLoading = false);

    if (result['code'] == 1) {
      // Success!
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created! Please log in.'), backgroundColor: Colors.green),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    } else {
      // Error from PHP (e.g., Email already exists)
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message']), backgroundColor: Colors.red),
      );
    }
  }

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
                const Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                
                // 3. Pass controllers to the TextFields
                _buildTextField(hint: 'Username', controller: _nameController),
                const SizedBox(height: 20),
                _buildTextField(hint: 'Email', controller: _emailController),
                const SizedBox(height: 20),
                _buildTextField(hint: 'Password', isPassword: true, controller: _passwordController),
                const SizedBox(height: 30),
                
                _isLoading 
                  ? const CircularProgressIndicator(color: Colors.green)
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: _handleSignUp, // Trigger the logic
                      child: const Text('Sign Up', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  child: const Text("Already have an account? Log In", style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required TextEditingController controller, bool isPassword = false}) {
    return TextField(
      controller: controller, // Link the controller
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),
    );
  }
}