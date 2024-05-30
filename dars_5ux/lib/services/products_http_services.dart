import 'dart:convert';

import 'package:dars_5ux/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsHttpServices {
  Future<List<Product>> getProducts() async {
    Uri url =
        Uri.parse("https://dars3ux-default-rtdb.firebaseio.com/products.json");

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Product> loadedProducts = [];
    if (data != null) {
      data.forEach((key, value) {
        value['id'] = key;
        loadedProducts.add(
          Product.fromJson(value),
        );
      });
    }

    return loadedProducts;
  }
}
