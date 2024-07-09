import 'package:flutter/material.dart';
import 'screens/invoice_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InvoiceScreen(),
    );
  }
}
