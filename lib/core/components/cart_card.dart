import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/cart/cart_bloc.dart';
import 'package:flutter_foodstore/core/constants/app_config.dart';
import 'package:flutter_foodstore/core/utils/currency_helper.dart';
import 'package:flutter_foodstore/resource/model/cart_response_model.dart';

class CartCard extends StatefulWidget {
  final Cart cart;

  const CartCard({super.key, required this.cart});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      '${AppConfig.STORAGE_IMAGE}${widget.cart.product?.image}',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cart.product?.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          CurrencyHelper.formatRupiah(
                              widget.cart.product?.price?.toDouble() ?? 0),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removeItem(widget.cart.id),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.orangeAccent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () => _decreaseQuantity(
                            widget.cart.productId ?? 0,
                            widget.cart.id ?? 0,
                            widget.cart.qty ?? 0),
                      ),
                      Text(
                        widget.cart.qty.toString(),
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () => _increaseQuantity(
                          widget.cart.productId ?? 0,
                          widget.cart.id ?? 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _removeItem(int? id) {
    context.read<CartBloc>().add(CartEvent.removeCart(cartId: id ?? 0));
  }

  void _decreaseQuantity(int productId, int cartId, int qty) {
    if (qty == 1) {
      return;
    }
    context
        .read<CartBloc>()
        .add(CartEvent.decrement(productId: productId, cartId: cartId));
  }

  void _increaseQuantity(int productId, int cartId) {
    context
        .read<CartBloc>()
        .add(CartEvent.increment(productId: productId, cartId: cartId));
  }
}
