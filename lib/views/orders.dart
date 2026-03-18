import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class OrdersPage extends StatelessWidget {

  // List of orders
  final List<Map<String, String>> orders = [
    {'name': 'Samsung S24 Ultra', 'date': 'Dec 12, 2024', 'status': 'Delivered', 'price': '₦890,000'},
    {'name': 'Nike Air Max 270',  'date': 'Dec 10, 2024', 'status': 'In Transit','price': '₦62,000'},
    {'name': 'HP Laptop 15"',     'date': 'Dec 7,  2024', 'status': 'Processing','price': '₦320,000'},
    {'name': 'Smart Watch',       'date': 'Nov 28, 2024', 'status': 'Delivered', 'price': '₦45,000'},
    {'name': 'AirPods Pro',       'date': 'Nov 15, 2024', 'status': 'Cancelled', 'price': '₦85,000'},
  ];

  // This function returns a color based on the status word
  Color getStatusColor(String status) {
    if (status == 'Delivered')  return Colors.green;
    if (status == 'In Transit') return Colors.blue;
    if (status == 'Processing') return Colors.orange;
    if (status == 'Cancelled')  return Colors.red;
    return Colors.grey; // default if status is unknown
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ── Top bar ─────────────────────────────────
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'My Orders',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      // ── List of orders ───────────────────────────
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: orders.length + 1, // +1 for bottom spacing
        itemBuilder: (context, index) {

          // Last item = empty space above nav bar
          if (index == orders.length) {
            return SizedBox(height: 80);
          }

          final order = orders[index];
          final statusColor = getStatusColor(order['status']!);

          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [

                // ── Left side: name, date, status ──
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        order['date']!,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 8),

                      // Colored status badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          order['status']!,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Right side: price ───────────────
                Text(
                  order['price']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 14,
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}