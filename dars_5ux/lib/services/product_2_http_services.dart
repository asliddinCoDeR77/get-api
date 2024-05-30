import 'dart:convert';
import 'package:dars_5ux/models/product_2.dart';
import 'package:dars_5ux/views/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.escuelajs.co/api/v1/products'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Product> products =
            jsonResponse.map((product) => Product.fromJson(product)).toList();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(products: products),
          ),
        );
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (error) {
      showError(error);
    }
  }

  void showError(Object error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text('Failed to load products: $error'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
