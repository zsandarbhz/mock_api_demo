import 'package:floor/floor.dart';
import 'package:mock_api_demo/app/core/local_db/entity/cart_item.dart';

@dao
abstract class CartDao {
  @Query('SELECT * FROM CartItem')
  Future<List<CartItem>> findAllCartItems();

  @Query('SELECT * FROM CartItem WHERE productId = :id')
  Future<CartItem?> findProductById(String id);

  @insert
  Future<void> insertCartItem(CartItem cartItem);

  @update
  Future<void> updateCartItem(CartItem cartItem);

  @delete
  Future<void> deleteCartItem(CartItem cartItem);

  @delete
  Future<int> deleteAll(List<CartItem> list);

  @Query('UPDATE CartItem SET quantity = :quantity WHERE productId = :id')
  Future<void> updateQuantity(String id, int quantity);

  @Query('DELETE FROM CartItem')
  Future<void> clearCart();
}
