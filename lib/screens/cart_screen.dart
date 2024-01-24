import 'package:ecombuy/main.dart';
import 'package:ecombuy/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Cart',
          style: textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${cart.totalQuantity} Items in the Cart',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16.0,
              ),
              (cart.cartItems.isEmpty)
                  ? const Text('No items in the cart')
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.cartItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final cartItem = cart.cartItems[index];
                        return CartItemCard(cartItem: cartItem);
                      })
            ],
          ),
        ),
      ),
    );
  }
}
