import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PurchaseHistoryPage extends StatefulWidget {
  final String userId;

  const PurchaseHistoryPage({Key? key, required this.userId}) : super(key: key);

  @override
  _PurchaseHistoryPageState createState() => _PurchaseHistoryPageState();
}

class _PurchaseHistoryPageState extends State<PurchaseHistoryPage> {
  List<dynamic> purchaseHistory = [];

  @override
  void initState() {
    super.initState();
    fetchPurchaseHistory();
  }

  Future<void> fetchPurchaseHistory() async {
    final response = await http.get(Uri.parse('http://YOUR_API_BASE_URL/api/purchases/user/${widget.userId}'));

    if (response.statusCode == 200) {
      setState(() {
        purchaseHistory = json.decode(response.body);
      });
    } else {
      // Handle error
      print('Failed to load purchase history');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Purchase History'),
      ),
      body: ListView.builder(
        itemCount: purchaseHistory.length,
        itemBuilder: (context, index) {
          final purchase = purchaseHistory[index];
          return _buildOrderItem(
            purchase['productName'],
            purchase['packets'],
            purchase['customerId'],
            purchase['customerPhone'],
            purchase['netAmount'],
            purchase['isSuccess'],
          );
        },
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
          // Handle tap
        },
      ),
    );
  }
}
