import 'package:flutter/material.dart';
import 'package:invoice_frontend/services/api_service.dart';

class PaymentScreen extends StatelessWidget {
  final Map<String, dynamic> invoice;

  PaymentScreen({required this.invoice});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    phoneController.text = ''; // Initialize as empty

    return Scaffold(
      appBar: AppBar(
        title: Text('Pay with Mpesa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final phone = phoneController.text;
                final amount = invoice['amount'] is String
                    ? double.tryParse(invoice['amount'])
                    : invoice['amount'].toDouble();

                if (phone.isEmpty || amount == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Please enter a valid phone number and amount'),
                  ));
                  return;
                }

                try {
                  final response = await ApiService.payWithMpesa(
                    invoice['id'],
                    phone,
                    amount,
                  );
                  print('Payment response: $response');

                  // Check the response for success
                  if (response['ResponseCode'] == '0') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Payment initiated successfully!'),
                    ));

                    // Update invoice status
                    invoice['status'] = 'paid';

                    // Return to the invoice list after payment
                    Navigator.pop(context, true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Failed to initiate payment: ${response['ResponseDescription']}'),
                    ));
                  }
                } catch (e) {
                  print('Error initiating payment: $e');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Failed to initiate payment'),
                  ));
                }
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
