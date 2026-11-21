import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/cart/cart_bloc.dart';
import 'package:flutter_foodstore/core/constants/app_config.dart';
import 'package:flutter_foodstore/core/utils/currency_helper.dart';
import 'package:flutter_foodstore/resource/model/product_model.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final bool isPopular;
  const ProductCard({
    super.key,
    required this.product,
    required this.isPopular,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return widget.isPopular
        ? _buildProductCardPopular(widget.product)
        : _buildProductCardNew(widget.product);
  }

  /// Widget untuk Card Product New
  Widget _buildProductCardNew(ProductModel product) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () => _navigateToDetailProduct(product),
        child: SizedBox(
          width: 180,
          child: Stack(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      child: Image.network(
                          '${AppConfig.STORAGE_IMAGE}${product.image}',
                          fit: BoxFit.cover,
                          width: 150),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        CurrencyHelper.formatRupiah(
                            product.price?.toDouble() ?? 0),
                        style: TextStyle(color: Colors.green.shade700),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            product.ratingsAvgRating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(right: 10, bottom: 10, child: _addToCartButton(product))
          ]),
        ),
      ),
    );
  }

  /// Widget untuk Card Product Popular
  Widget _buildProductCardPopular(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => _navigateToDetailProduct(product),
          child: SizedBox(
            width: 180,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.network(
                          '${AppConfig.STORAGE_IMAGE}${product.image}',
                          fit: BoxFit.cover,
                          width: double.infinity),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          CurrencyHelper.formatRupiah(
                              product.price?.toDouble() ?? 0),
                          style: TextStyle(color: Colors.green.shade700),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 16),
                            Text(
                              product.ratingsAvgRating.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(right: 2, bottom: 2, child: _addToCartButton(product))
            ]),
          ),
        ),
      ),
    );
  }

  /// Tombol Add to Cart
  Widget _addToCartButton(ProductModel product) {
    return IconButton.filledTonal(
      onPressed: () {
        context
            .read<CartBloc>()
            .add(CartEvent.addCart(productId: product.id ?? 0, qty: 1));
      },
      icon: const Icon(
        Icons.add_shopping_cart_rounded,
        color: Colors.white,
      ),
    );
  }

  /// Navigasi ke Detail Product
  void _navigateToDetailProduct(ProductModel product) {
    context.push('/detailProduct/${product.slug}');
  }
}
