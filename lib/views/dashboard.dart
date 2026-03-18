import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class DashboardPage extends StatelessWidget {

  // A simple list of products to show
  final List<Map<String, String>> products = [
    {'name': 'Samsung S24',  'price': 'ksh890,000', 'emoji': '📱'},
    {'name': 'Nike Air Max', 'price': 'ksh62,000',  'emoji': '👟'},
    {'name': 'HP Laptop',    'price': 'ksh320,000', 'emoji': '💻'},
    {'name': 'Smart Watch',  'price': 'ksh45,000',  'emoji': '⌚'},
    {'name': 'AirPods Pro',  'price': 'ksh85,000',  'emoji': '🎧'},
    {'name': 'iPad Mini',    'price': 'ksh210,000', 'emoji': '📲'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ── Top bar ─────────────────────────────────
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Jumia',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Greeting ──────────────────────────
            Text('Good morning 👋', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(
              'What are you shopping for?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            // ── Search Bar ────────────────────────
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search, color: primaryColor),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 20),

            // ── Banner ────────────────────────────
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Flash Sale! ⚡',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Up to 70% off today only',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // ── Best Sellers Label ────────────────
            Text(
              'Best Sellers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),

            // ── Products Grid ─────────────────────
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: products.map((product) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(product['emoji']!, style: TextStyle(fontSize: 40)),
                        SizedBox(height: 8),
                        Text(
                          product['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        Text(
                          product['price']!,
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 80), // space above bottom nav bar

          ],
        ),
      ),
    );
  }
}