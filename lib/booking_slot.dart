import 'package:ai_chatbox/success_page.dart';
import 'package:flutter/material.dart';

class BookSeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Seat right now!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: Text('Select Doctor Type'),
              items: [
                'General',
                'Gastroenterologist',
                'Gynecologist',
                'Orthopedist',
                'Ophthalmologist',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle selection
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle booking slot
                // Show circular progress indicator
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                // Simulating loading with Future.delayed
                Future.delayed(Duration(seconds: 3), () {
                  // Navigate to success page after 3 seconds
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessPage()),
                  );
                });
              },
              child: Text('Book a Slot'),
            ),
          ],
        ),
      ),
    );
  }
}
