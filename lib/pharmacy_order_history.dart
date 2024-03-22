import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildOrderItem('Dolo 650', '10', '1176', '+1234567890', '\$100.00', true),
          _buildOrderItem('Crocin', '5', '2654', '+9876543210', '\$50.00', false),
          _buildOrderItem('Citrazine', '2', '8355', '+1357924680', '\$20.00', true),
          _buildOrderItem('Vittal pill', '3', '4766', '+1357924680', '\$30.00', null),
          // Add more order items as needed
        ],
      ),
    );
  }

  Widget _buildOrderItem(String productName, String packets, String customerId, String customerPhone, String netAmount, bool? isSuccess) {
    String statusText = isSuccess != null ? (isSuccess ? 'Completed' : 'Failed') : 'Live';
    Color statusColor = isSuccess != null ? (isSuccess ? Colors.green : Colors.red) : Colors.blue;

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
        trailing: Icon(
          isSuccess != null ? (isSuccess ? Icons.check_circle : Icons.cancel) : Icons.live_tv,
          color: statusColor,
        ),
        onTap: () {
          //
        },
      ),
    );
  }
}
