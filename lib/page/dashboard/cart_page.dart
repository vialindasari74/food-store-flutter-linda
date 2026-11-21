import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/auth/auth_bloc.dart';
import 'package:flutter_foodstore/bloc/cart/cart_bloc.dart';
import 'package:flutter_foodstore/core/components/cart_card.dart';
import 'package:flutter_foodstore/core/utils/currency_helper.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalPrice = 0;
  int totalWeight = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Expanded(
          child: _buildCartList(),
        ),
        _buildBottomNavigation(),
      ]),
    );
  }

  /// List Keranjang
  Widget _buildCartList() {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (cartResponse) => {
            setState(() {
              totalPrice = cartResponse.totalPrice ?? 0;
              totalWeight = cartResponse.totalWeight ?? 0;
            })
          },
          error: (message) {
            if (message == '401') {
              context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
            }
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (cartResponse) {
            return cartResponse.carts?.isNotEmpty == true
                ? ListView.builder(
                    itemCount: cartResponse.carts?.length,
                    itemBuilder: (context, index) => CartCard(
                      cart: cartResponse.carts![index],
                    ),
                  )
                : _buildEmptyCart();
          },
          orElse: () => const Center(child: Text('Something went wrong')),
        );
      },
    );
  }

  /// Bottom Navigation Bar
  Widget _buildBottomNavigation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTotalPrice(),
          const SizedBox(height: 8),
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  /// Widget Total Harga
  Widget _buildTotalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          CurrencyHelper.formatRupiah(totalPrice.toDouble()),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
      ],
    );
  }

  /// Tombol Checkout
  Widget _buildCheckoutButton() {
    return FilledButton(
      onPressed:
          (totalPrice > 0 && totalWeight > 0) ? _navigateToCheckout : null,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Center(
        child: Text(
          'Proceed to Checkout',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Navigasi ke Halaman Checkout
  void _navigateToCheckout() {
    context.push('/checkout?totalPrice=$totalPrice&totalWeight=$totalWeight');
  }

  /// Widget Keranjang Kosong
  Widget _buildEmptyCart() {
    return const Center(
      child: Text(
        "Data kosong",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
