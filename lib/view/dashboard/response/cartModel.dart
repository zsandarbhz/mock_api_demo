import '../../../app/core/models/product/product_data.dart';

class CartModel {
  String? productId;
  String? name;
  int? quantity;
  int? mrp;
  int? discount;
  ProductData? product;

  CartModel(this.productId,this.name,this.quantity,this.mrp,this.discount,this.product);

  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    quantity = json['quantity'];
    mrp = json['mrp'];
    discount = json['discount'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['mrp'] = this.mrp;
    data['discount'] = this.discount;
    data['product'] = this.product;
    return data;
  }
}
