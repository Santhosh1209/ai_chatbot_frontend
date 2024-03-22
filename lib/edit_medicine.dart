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
          _buildTextField('Medicine ID', '69420'),
          _buildTextField('Manufacturer', 'Joe Mama'),
          _buildTextField('Medicine Name', 'Paracetamol'),
          _buildTextField('Generic Name', 'Dolo 650'),
          _buildTextField('Pack Size', '10'),
          _buildTextField('Price', '\$10.00'),
          _buildTextField('Stock Available', '100'),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
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
