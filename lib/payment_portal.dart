import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPortal extends StatefulWidget {
  @override
  _PaymentPortalState createState() => _PaymentPortalState();
}

class _PaymentPortalState extends State<PaymentPortal> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    print('Payment Successful: ${response.paymentId}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print('Payment Error: ${response.code} - ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet payment
    print('External Wallet: ${response.walletName}');
  }

  void _openPaymentGateway() {
    var options = {
      'key': 'rzp_test_bRBL3c7YliH0ki',
      'amount': 80000, // paisa in INR
      'name': 'Shiv Prakash',
      'description': 'Payment for Rolex',
      'prefill': {
        'contact': '6942042069',
        'email': 'selva@bharathi.com',
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Portal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openPaymentGateway,
          child: Text('Make Payment'),
        ),
      ),
    );
  }
}
