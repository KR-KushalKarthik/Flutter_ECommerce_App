import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Order Tracking Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Track Your Order Here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Order ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your order is being tracked.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Track Order'),
            ),
            SizedBox(height: 20),
            // Contact Information Section
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Display user's contact information
            Text('Phone: 1234567890'),
            Text('Email: kushalkarthik@gmail.com'),
            SizedBox(height: 20),
            // Support Button
            ElevatedButton(
              onPressed: () {
                // Navigate to customer support screen
              },
              child: Text('Contact Support'),
            ),
            SizedBox(height: 20),
            // Promotional Offers Section
            Text(
              'Promotional Offers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Display ongoing promotional offers
            Text('Get 10% off on your next order with code: SAVE10'),
            SizedBox(height: 20),
            // Track Package Button
            ElevatedButton(
              onPressed: () {
                // Implement track package functionality
              },
              child: Text('Track Package'),
            ),
            SizedBox(height: 20),
            // Estimated Delivery Time
            Text(
              'Estimated Delivery Time',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Display estimated delivery time
            Text('Expected Delivery: March 20, 2024'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OrderTrackingScreen(),
  ));
}
