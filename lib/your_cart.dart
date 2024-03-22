import 'package:ai_chatbox/payment_portal.dart';
import 'package:flutter/material.dart';

class YourCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildOrderItem('Dolo 650', '10', '1176', '+1234567890', '\$100.00', Image.asset('assets/medicine_image.jpg', height: 50.0, width: double.infinity, fit: BoxFit.cover)),
          _buildOrderItem('Crocin', '5', '2654', '+9876543210', '\$50.00', Image.asset('assets/medicine_image.jpg', height: 50.0, width: double.infinity, fit: BoxFit.cover)),
          _buildOrderItem('Umesh pill', '2', '8355', '+1357924680', '\$20.00', Image.asset('assets/medicine_image.jpg', height: 50.0, width: double.infinity, fit: BoxFit.cover)),
          _buildOrderItem('Ganja', '3', '4766', '+1357924680', '\$30.00', Image.asset('assets/medicine_image.jpg', height: 50.0, width: double.infinity, fit: BoxFit.cover)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentPortal()),
          );
        },
        label: Text('Proceed to Pay'),
        icon: Icon(Icons.payment),
      ),
    );
  }

  Widget _buildOrderItem(String productName, String packets, String customerId, String customerPhone, String netAmount, final image) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text('Packets: $packets'),
            Text('Customer ID: $customerId'),
            Text('Phone: $customerPhone'),
            Text('Net Amount: $netAmount'),
          ],
        ),
        trailing: SizedBox(
          width: 75.0,
          height: 200.0,
          child: image,
        ),
        onTap: () {
          // Add your action here
        },
      ),
    );
  }
}