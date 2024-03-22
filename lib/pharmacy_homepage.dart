import 'package:ai_chatbox/pharmacy_order_history.dart';
import 'package:ai_chatbox/your_cart.dart';
import 'package:flutter/material.dart';
import 'checking_stock_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pharmacy Name', // Replace with actual pharmacy name
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Image.asset(
                'assets/pharmacy_image.jpg',
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              _buildDetailRow('Address', 'Vittal Street, Sathish Nagar, Yazhini City - 600018'),
              _buildDetailRow('Phone', '+1234567890'),
              _buildDetailRow('Email', 'summa@svce.com'),
              _buildDetailRow('Working Hours', '9:00 AM - 6:00 PM'),
              _buildDetailRow('No of Employees', '8'),
              _buildDetailRow('Rating', '4.65 ⭐️'),
              _buildDetailRow('No of Medicine Types', '85'),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckingStockPage()),
                      );
                    },
                    child: Text('Check Stock'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => YourCartPage()),
                      );
                    },
                    child: Text('Track Your Orders'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label + ': ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}