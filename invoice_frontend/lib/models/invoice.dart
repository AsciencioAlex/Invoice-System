class Invoice {
  final int id;
  final String email;
  final String product;

  Invoice({required this.id, required this.email, required this.product});

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      email: json['email'],
      product: json['product'],
    );
  }
}
