class ProductData {
  String? createdAt;
  String? name;
  String? image;
  String? price;
  String? description;
  String? shortDescription;
  int? qty;
  String? id;

  ProductData(
      {this.createdAt,
        this.name,
        this.image,
        this.price,
        this.description,
        this.shortDescription,
        this.qty,
        this.id});

  ProductData.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    qty = json['qty'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    data['shortDescription'] = this.shortDescription;
    data['qty'] = this.qty;
    data['id'] = this.id;
    return data;
  }
}
