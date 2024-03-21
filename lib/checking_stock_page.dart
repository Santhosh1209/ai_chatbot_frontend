import 'package:flutter/material.dart';

import 'about_medicine.dart';
import 'add_medicine.dart';

class CheckingStockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checking Stock'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search for Medicine',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual number of medicines
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutMedicinePage()), // Replace DetailsPage() with your details page widget
                      );
                    },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        //backgroundImage: AssetImage('assets/medicine_icon.png'), // Replace with actual image
                      ),
                      title: Text('Medicine Name'), // Replace with actual medicine name
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$10.00'), // Replace with actual price
                          Text('Available Stock: 100'), // Replace with actual stock
                          Text('Demand: High'), // Replace with actual demand
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMedicinePage()), // Replace DetailsPage() with your details page widget
              );
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
