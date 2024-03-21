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
                        MaterialPageRoute(builder: (context) => AboutMedicinePage()),
                      );
                    },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        //backgroundImage: AssetImage('assets/medicine_icon.png'),
                      ),
                      title: Text('Medicine Name'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$10.00'),
                          Text('Available Stock: 100'),
                          Text('Demand: High'),
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
                MaterialPageRoute(builder: (context) => AddMedicinePage()),
              );
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
