import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ── Top bar ─────────────────────────────────
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            SizedBox(height: 10),

            // ── Avatar & Name ────────────────────────
            CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: Text(
                'AA',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 12),

            Text(
              'Ahmed Amour',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(
              'abdalaamour69@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 28),

            // ── Menu items ───────────────────────────
            buildMenuItem(Icons.person,      'Edit Profile',    Colors.green),
            buildMenuItem(Icons.location_on, 'My Addresses',    Colors.blue),
            buildMenuItem(Icons.payment,     'Payment Methods', Colors.purple),
            buildMenuItem(Icons.favorite,    'Wishlist',        Colors.red),
            buildMenuItem(Icons.help,        'Help & Support',  Colors.teal),
            buildMenuItem(Icons.settings,    'Settings',        Colors.grey),

            SizedBox(height: 20),

            // ── Sign Out Button ───────────────────────
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Go back to login screen
                  Get.offAndToNamed("/");
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 80), // space above nav bar

          ],
        ),
      ),
    );
  }

  // ── Helper: builds one menu row ─────────────────
  // This is a function so we don't repeat the same code for each menu item
  Widget buildMenuItem(IconData icon, String label, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: () {
          // TODO: navigate to each settings page
        },
      ),
    );
  }
}