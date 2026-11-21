import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/product/product_cubit.dart';
import 'package:flutter_foodstore/core/components/product_card.dart';
import 'package:go_router/go_router.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildProductList(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
      ),
      title: const Text(
        'All Product',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildProductList() {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        state.maybeWhen(
          loadedProduct: (products, hasMore) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          loadedProduct: (products, hasMore) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: products.length + (hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= products.length) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                            bottom: 16,
                          ),
                          child: FilledButton(
                            onPressed: () =>
                                context.read<ProductCubit>().fetchProduct(),
                            child: const Text(
                              "Load More",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          context.push('/detailProduct/${product.slug}');
                        },
                        child: ProductCard(product: product, isPopular: false),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          orElse: () => const Center(child: Text('Something went wrong')),
        );
      },
    );
  }
}
