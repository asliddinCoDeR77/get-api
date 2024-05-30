import 'package:dars_5ux/models/product.dart';
import 'package:dars_5ux/services/products_http_services.dart';

class ProductsController {
  final productsHttpServices = ProductsHttpServices();
  List<Product> _list = [
    Product(
      id: '1',
      title: 'Iphone 12',
      price: 358.89,
    ),
  ];

  Future<List<Product>> get list async {
    _list = await productsHttpServices.getProducts();
    return [..._list];
  }
}
