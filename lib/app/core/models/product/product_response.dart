import 'product_data.dart';

class ProductResponse {
  bool? status;
  String? message;
  List<ProductData>? data;
  ProductResponse({
    this.status,
    this.message,
    this.data,});

  ProductResponse.fromJson(dynamic json) {
    if (json != null) {
      data = <ProductData>[];
      json.forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }

}