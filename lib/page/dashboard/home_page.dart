import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/cart/cart_bloc.dart';
import 'package:flutter_foodstore/bloc/category/category_cubit.dart';
import 'package:flutter_foodstore/bloc/product/product_cubit.dart';
import 'package:flutter_foodstore/bloc/product_populer/product_populer_cubit.dart';
import 'package:flutter_foodstore/bloc/slider/slider_cubit.dart';
import 'package:flutter_foodstore/core/components/category_card.dart';
import 'package:flutter_foodstore/core/components/product_card.dart';
import 'package:flutter_foodstore/core/constants/app_config.dart';
import 'package:flutter_foodstore/resource/model/slider_model.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        state.whenOrNull(
          cartStored: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.green,
            ),
          ),
          error: (message) {
            if (message == '401') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  showCloseIcon: true,
                  content: Text('Please Login First'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        );
      },
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSliderSection(),
            _buildCategorySection(),
            _buildProductSection(
              title: "Product Popular",
              icon: Icons.shopping_bag_outlined,
              cubit: BlocBuilder<ProductPopulerCubit, ProductPopulerState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => _buildLoadingIndicator(),
                    loadedProductPopuler: (products) => products.isNotEmpty
                        ? SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                final product = products[index];
                                return ProductCard(
                                  product: product,
                                  isPopular: true,
                                );
                              },
                            ),
                          )
                        : _buildEmptyMessage(),
                    orElse: () =>
                        _buildErrorMessage("Failed to load popular products"),
                  );
                },
              ),
            ),
            _buildProductSection(
              title: "Product Terbaru",
              icon: Icons.shopping_bag_outlined,
              cubit: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => _buildLoadingIndicator(),
                    loadedProduct: (products, hasMore) => products.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return ProductCard(
                                product: product,
                                isPopular: false,
                              );
                            },
                          )
                        : _buildEmptyMessage(),
                    orElse: () =>
                        _buildErrorMessage("Failed to load latest products"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSection({
    required String title,
    required IconData icon,
    required Widget cubit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: _buildSectionHeader(title, icon),
          ),
          cubit,
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 4),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
        GestureDetector(
          onTap: () => _navigateToAllProducts(),
          child: Text(
            'Lihat Lainnya',
            style: TextStyle(
                fontSize: 14,
                color: Colors.orange.shade800,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => _buildLoadingIndicator(),
          loaded: (categories) => categories.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryCard(
                          category: category,
                        );
                      },
                    ),
                  ),
                )
              : _buildEmptyMessage(),
          orElse: () => _buildErrorMessage("Failed to load categories"),
        );
      },
    );
  }

  Widget _buildSliderSection() {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => _buildLoadingIndicator(),
          loaded: (sliders) => _buildImageSlider(sliders),
          orElse: () => _buildErrorMessage("Failed to load sliders"),
        );
      },
    );
  }

  Widget _buildImageSlider(List<SliderModel> sliders) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              itemCount: sliders.length,
              itemBuilder: (context, index) {
                final slider = sliders[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    '${AppConfig.STORAGE_IMAGE}${slider.image}',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          _buildSliderNavigationButton(Icons.arrow_back_ios, () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
          _buildSliderNavigationButton(Icons.arrow_forward_ios, () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }, alignRight: true)
        ],
      ),
    );
  }

  Widget _buildSliderNavigationButton(
    IconData icon,
    VoidCallback onPressed, {
    bool alignRight = false,
  }) {
    return Positioned(
      left: alignRight ? null : 8,
      right: alignRight ? 8 : null,
      top: 50,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildErrorMessage(String message) => Center(child: Text(message));

  Widget _buildLoadingIndicator() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildEmptyMessage() =>
      const Center(child: Text("Tidak ada data tersedia"));

  void _navigateToAllProducts() {
    context.push('/allProducts');
  }
}
