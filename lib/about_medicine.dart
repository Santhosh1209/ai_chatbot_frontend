import 'package:flutter/material.dart';

import 'edit_medicine.dart';

class AboutMedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Medicine'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Medicine Name',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Image.asset(
            'assets/medicine_image.jpg',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          _buildMedicineDetails(),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditMedicinePage()),
                );
              },
              child: Text('Edit'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Medicine ID', '69420'),
        _buildDetailRow('Manufacturer', 'Joe Mama'), // Replace with actual data
        _buildDetailRow('Medicine Name', 'Paracetamol'), // Replace with actual data
        _buildDetailRow('Generic Name', 'Dolo 650'), // Replace with actual data
        _buildDetailRow('Pack Size', '10'), // Replace with actual data
        _buildDetailRow('Price', '\$10.00'), // Replace with actual data
        _buildDetailRow('Stock Available', '100'), // Replace with actual data
        _buildDetailRow('Expiry Date', '2024-12-31'), // Replace with actual data
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
