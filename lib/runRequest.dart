import 'classes.dart';
import 'request.dart';

void main(List<String> args) async {
  final apiService = ApiService();
  try {
    List<Product> pro = await apiService.getAllProducts();
    for (var p in pro) {
      print('> Product : ${p.product_name},Price: ${p.price}');
    }
  } catch (e) {
    print(e);
  }
}
