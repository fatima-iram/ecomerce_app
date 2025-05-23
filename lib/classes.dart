class Product {
  int id;
  String product_name;
  double price;
  String description;
  String imageURL;
  Product(
      this.id, this.product_name, this.price, this.description, this.imageURL);
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['title'], // API uses 'title' for product name
      (json['price'] as num).toDouble(), // ensure double type
      json['description'],
      json['image'],
    );
  }
}

class CartItem {
  int productId, quantity;
  CartItem(this.productId, this.quantity);
}

class Order {
  CartItem cartItem;
  DateTime deliveryDate;
  //print(deliveryDate);
  String address;
  int userId;
  Order(this.cartItem, this.deliveryDate, this.userId, this.address);
}
