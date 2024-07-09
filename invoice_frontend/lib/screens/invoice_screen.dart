import 'package:flutter/material.dart';
import 'payment_screen.dart';
import '../services/api_service.dart';

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final _emailController = TextEditingController();
  final _productController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice System'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _productController,
              decoration: InputDecoration(labelText: 'Product'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final email = _emailController.text;
                  final product = _productController.text;
                  final invoice =
                      await _apiService.createInvoice(email, product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(invoice: invoice),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create invoice: $e')),
                  );
                }
              },
              child: Text('Create Invoice'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                try {
                  final email = _emailController.text;
                  final product = _productController.text;
                  final response = await _apiService.stkPush(email, product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('STK Push initiated: ${response['message']}')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to initiate STK Push: $e')),
                  );
                }
              },
              child: Text('STK Push'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                try {
                  final invoices = await _apiService.getInvoices();
                  // Handle the fetched invoices as needed
                  print(invoices);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to fetch invoices: $e')),
                  );
                }
              },
              child: Text('Get Invoices'),
            ),
          ],
        ),
      ),
    );
  }
}
