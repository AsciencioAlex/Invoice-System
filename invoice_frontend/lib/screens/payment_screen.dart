import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final Map<String, dynamic> invoice;

  PaymentScreen({required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Invoice ID: ${invoice['id']}'),
            Text('Email: ${invoice['email']}'),
            Text('Product: ${invoice['product']}'),
            Text('Amount: ${invoice['amount']}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement payment initiation logic here
                // For example, calling an API to initiate the payment
              },
              child: Text('Initiate Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
