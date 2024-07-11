import 'package:flutter/material.dart';
import 'package:invoice_frontend/services/api_service.dart';

class CreateInvoiceScreen extends StatefulWidget {
  @override
  _CreateInvoiceScreenState createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  final _emailController = TextEditingController();
  final _productController = TextEditingController();
  final _amountController = TextEditingController();

  Future<void> createInvoice(
      String email, String product, double amount) async {
    try {
      final invoice = await ApiService.createInvoice(email, product, amount);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invoice created successfully'),
      ));
      Navigator.pop(context, true);
    } catch (error) {
      print('Error creating invoice: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to create invoice'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _productController,
              decoration: InputDecoration(
                labelText: 'Product',
                prefixIcon: Icon(Icons.shopping_bag),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final product = _productController.text;
                final amount = double.tryParse(_amountController.text) ?? 0.0;
                if (email.isEmpty || product.isEmpty || amount <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter valid details'),
                  ));
                  return;
                }
                createInvoice(email, product, amount);
              },
              child: Text('Create Invoice'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
