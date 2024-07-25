class OrderProductResponse {
  String? productId;
  String? name;
  String? sku;
  String? shortDescription;
  String? longDescription;
  int? unit;
  String? type;
  int? taxes;
  int? amount;
  int? quantity;

  OrderProductResponse(
      {this.productId,
        this.name,
        this.sku,
        this.shortDescription,
        this.longDescription,
        this.type,
        this.unit,
        this.taxes,
        this.amount,
        this.quantity,
        });

  OrderProductResponse.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    sku = json['sku'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    type = json['type'];
    unit = json['unit'];
    taxes = json['taxes'];
    amount = json['amount'];
    quantity = json['quantity'];

  }
  List<OrderProductResponse> fromList(var list) {
    //print("Hello $list");
    List<OrderProductResponse> li = [];
    for (var i in list) {
      li.add(OrderProductResponse.fromJson(i));
    }
    return li;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['shortDescription'] = this.shortDescription;
    data['longDescription'] = this.longDescription;
    data['type'] = this.type;
    data['unit'] = this.unit;
    data['taxes'] = this.taxes;
    data['amount'] = this.amount;
    data['quantity'] = this.quantity;

    return data;
  }
}
