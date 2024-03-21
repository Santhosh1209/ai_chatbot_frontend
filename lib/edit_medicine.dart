import 'package:flutter/material.dart';

class EditMedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Medicine'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Text fields for editing medicine details
          _buildTextField('Medicine ID', '12345'), // Replace with actual data
          _buildTextField('Manufacturer', 'Manufacturer Name'), // Replace with actual data
          _buildTextField('Medicine Name', 'Medicine Name'), // Replace with actual data
          _buildTextField('Generic Name', 'Generic Name'), // Replace with actual data
          _buildTextField('Pack Size', '10'), // Replace with actual data
          _buildTextField('Price', '\$10.00'), // Replace with actual data
          _buildTextField('Stock Available', '100'), // Replace with actual data
          _buildTextField('Expiry Date', '2024-12-31'), // Replace with actual data
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Save edited medicine details and navigate back to About Medicine page
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
