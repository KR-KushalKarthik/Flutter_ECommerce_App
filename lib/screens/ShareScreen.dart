import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  final String productName;
  final String productImageUrl;

  ShareScreen({
    required this.productName,
    required this.productImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share $productName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Share $productName with your friends!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              productImageUrl,
              height: 200,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Share on WhatsApp
                    // Add your logic here
                  },
                  icon: Image.asset(
                    'assets/whatsapp.jpeg', // Replace with your WhatsApp icon image
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // Share on Instagram
                    // Add your logic here
                  },
                  icon: Image.asset(
                    'assets/ig.png', // Replace with your Instagram icon image
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // Share on Facebook
                    // Add your logic here
                  },
                  icon: Image.asset(
                    'assets/facebook.png', // Replace with your Facebook icon image
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // Share on Twitter
                    // Add your logic here
                  },
                  icon: Image.asset(
                    'assets/twitter.png', // Replace with your Twitter icon image
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Share via other platforms:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Add more share options here
          ],
        ),
      ),
    );
  }
}
