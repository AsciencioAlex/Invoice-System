import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.0.101:8000';

  Future<Map<String, dynamic>> createInvoice(
      String email, String product) async {
    final url = Uri.parse('$baseUrl/create-invoice');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'product': product}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create invoice');
    }
  }

  Future<Map<String, dynamic>> stkPush(String email, String product) async {
    final url = Uri.parse('$baseUrl/mpesa/stkpush');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'product': product}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to initiate STK push');
    }
  }

  Future<List<dynamic>> getInvoices() async {
    final url = Uri.parse('$baseUrl/invoices');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch invoices');
    }
  }
}
