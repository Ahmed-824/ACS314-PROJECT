import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class CategoriesPage extends StatelessWidget {

  // List of all categories
  final List<Map<String, String>> categories = [
    {'name': 'Phones & Tablets', 'emoji': '📱', 'count': '1,240 items'},
    {'name': 'Fashion',          'emoji': '👗', 'count': '3,820 items'},
    {'name': 'Groceries',        'emoji': '🛒', 'count': '760 items'},
    {'name': 'Electronics',      'emoji': '💻', 'count': '2,100 items'},
    {'name': 'Beauty & Health',  'emoji': '💄', 'count': '980 items'},
    {'name': 'Home & Garden',    'emoji': '🏠', 'count': '1,550 items'},
    {'name': 'Sports',           'emoji': '⚽', 'count': '640 items'},
    {'name': 'Toys & Kids',      'emoji': '🧸', 'count': '310 items'},
    {'name': 'Books',            'emoji': '📚', 'count': '420 items'},
    {'name': 'Automotive',       'emoji': '🚗', 'count': '890 items'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ── Top bar ─────────────────────────────────
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      // ── List of categories ───────────────────────
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categories.length + 1, // +1 for the bottom spacing
        itemBuilder: (context, index) {

          // Last item = empty space so content is not hidden by nav bar
          if (index == categories.length) {
            return SizedBox(height: 80);
          }

          final category = categories[index];

          return Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListTile(
              // Emoji as the icon on the left
              leading: Text(
                category['emoji']!,
                style: TextStyle(fontSize: 30),
              ),
              title: Text(
                category['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                category['count']!,
                style: TextStyle(color: Colors.grey),
              ),
              // Arrow on the right
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: primaryColor,
              ),
              onTap: () {
                // TODO: navigate to category detail screen
              },
            ),
          );
        },
      ),
    );
  }
}