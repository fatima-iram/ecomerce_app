import 'dart:convert';
// used to dart objects from json
import 'package:http/http.dart' as http;
import 'classes.dart';

class ApiService {
  String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl'));
    print('${response.body}');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
