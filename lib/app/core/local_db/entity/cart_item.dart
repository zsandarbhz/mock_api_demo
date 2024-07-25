
import 'package:floor/floor.dart';

@Entity(tableName: 'CartItem')
class CartItem {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? productId;
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({this.id,required this.productId, required this.name, required this.imageUrl, required this.price, required this.quantity});

}