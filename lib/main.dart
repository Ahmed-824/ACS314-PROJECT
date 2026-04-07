import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/player_provider.dart';
// 1. Import the SignUpScreen
import 'screens/auth/signup_screen.dart'; 
// (Keep the login import if you use it elsewhere, or remove if unused)
import 'screens/auth/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
      ],
      child: const SpotifyApp(),
    ),
  );
}

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Clone', // Added a title for the app
      theme: ThemeData(
        brightness: Brightness.dark,
        // Using Montserrat for that clean, modern music app look
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        // Adding a primary color to match your green theme
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
      ),
      // 2. Change LoginScreen() to SignUpScreen()
      home: const SignUpScreen(), 
    );
  }
}