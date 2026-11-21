import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/category/category_cubit.dart';
import 'package:flutter_foodstore/core/components/product_card.dart';
import 'package:go_router/go_router.dart';

class ProductByCategoryPage extends StatefulWidget {
  final String categoryName;
  const ProductByCategoryPage({super.key, required this.categoryName});

  @override
  State<ProductByCategoryPage> createState() => _ProductByCategoryPageState();
}

class _ProductByCategoryPageState extends State<ProductByCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Product In ${widget.categoryName}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loadedCategoryBySlug: (category) =>
                category.products?.isNotEmpty == true
                    ? ListView.builder(
                        itemCount: category.products?.length,
                        itemBuilder: (context, index) {
                          final product = category.products![index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child:
                                ProductCard(product: product, isPopular: false),
                          );
                        },
                      )
                    : const Center(child: Text('Product not found')),
            error: (message) => Center(child: Text(message)),
            orElse: () => const Center(child: Text('Something went wrong')),
          );
        },
      ),
    );
  }
}
