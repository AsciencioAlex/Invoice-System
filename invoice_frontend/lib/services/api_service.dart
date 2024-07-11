import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://invoice-system-17d5e8dc2a6f.herokuapp.com'; // Adjust this if needed

  // Method to create an invoice
  static Future<Map<String, dynamic>> createInvoice(
      String email, String product, double amount) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create-invoice'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'product': product,
        'amount': amount,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create invoice');
    }
  }

  // Method to pay with Mpesa
  static Future<Map<String, dynamic>> payWithMpesa(
      int invoiceId, String phone, double amount) async {
    final response = await http.post(
      Uri.parse('$baseUrl/stkpush'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'invoice_id': invoiceId,
        'phone': phone,
        'amount': amount,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to initiate payment');
    }
  }

  // Method to get all invoices
  static Future<List<dynamic>> getInvoices() async {
    final response = await http.get(Uri.parse('$baseUrl/invoices'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load invoices');
    }
  }

  // Method to delete an invoice
  static Future<void> deleteInvoice(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/invoices/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete invoice');
    }
  }
}
