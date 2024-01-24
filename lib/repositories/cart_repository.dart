import 'package:ecombuy/main.dart';
import 'package:uuid/uuid.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartRepository {
  const CartRepository();

  void addProductToCart(Product product, int quantity) {
    var existingCartItem = cart.cartItems
        .where((item) => item.product.id == product.id)
        .firstOrNull;

    if (existingCartItem != null) {
      //modify the quantity
      final initialQuantity = existingCartItem.quantity;

      cart = cart.copyWith(
          cartItems: List.from(cart.cartItems)
            ..remove(existingCartItem)
            ..add(existingCartItem.copyWith(
                quantity: initialQuantity + quantity)));
    } else {
      //add the product to cart
      cart = cart.copyWith(
          cartItems: List.from(cart.cartItems)
            ..add(CartItem(
                id: const Uuid().v4(), product: product, quantity: quantity)));
    }
  }

  removeProductFromCart(Product product, int quantity) {
    var existingCartItem = cart.cartItems
        .where((item) => item.product.id == product.id)
        .firstOrNull;

    // if(existing)
  }

  clearCart() {
    cart.cartItems.clear();
  }
}
