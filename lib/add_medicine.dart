import 'package:flutter/material.dart';

class AddMedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search for Medicine to Add',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with actual number of available medicines to add
              itemBuilder: (context, index) {
                return MedicineListItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MedicineListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showConfirmationDialog(context);
      },
      child: Card(
        child: ListTile(
          title: Text('Medicine Name'), // Replace with actual medicine name
          subtitle: Text('Approved by Admin'), // You can add logic to check if approved by admin
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          content: Text('Do you want to add this medicine to the stock?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add medicine to stock list logic
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}