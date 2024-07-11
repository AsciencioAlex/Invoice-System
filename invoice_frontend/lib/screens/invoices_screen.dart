import 'package:flutter/material.dart';
import 'package:invoice_frontend/services/api_service.dart';
import 'payment_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({Key? key}) : super(key: key);

  @override
  _InvoicesScreenState createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  Future<void> _deleteInvoice(BuildContext context, int id) async {
    try {
      await ApiService.deleteInvoice(id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invoice deleted successfully'),
      ));
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to delete invoice'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoices'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.getInvoices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load invoices'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No invoices found'));
          } else {
            final invoices = snapshot.data!;
            return ListView.builder(
              itemCount: invoices.length,
              itemBuilder: (context, index) {
                final invoice = invoices[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        invoice['id'].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      invoice['product'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Amount: \$${invoice['amount']} - Status: ${invoice['status']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(FontAwesomeIcons.moneyBillWave),
                          color: Colors.green,
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaymentScreen(invoice: invoice),
                              ),
                            );
                            if (result == true) {
                              // Refresh the list after payment
                              setState(() {});
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.print),
                          color: Colors.blue,
                          onPressed: () {
                            // Implement print functionality
                          },
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.trash),
                          color: Colors.red,
                          onPressed: () =>
                              _deleteInvoice(context, invoice['id']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
