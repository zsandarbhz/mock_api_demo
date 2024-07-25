class ProductAddResponse {
  String? productId;
  int? quantity;
  int? amount;
  int? taxes;

  ProductAddResponse(
      {this.productId,
        this.quantity,
        this.amount,
        this.taxes,
        });


  ProductAddResponse.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
    amount = json['amount'];
    taxes = json['taxes'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['taxes'] = this.taxes;
    return data;
  }
}
