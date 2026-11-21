import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/auth/auth_bloc.dart';
import 'package:flutter_foodstore/bloc/cart/cart_bloc.dart';
import 'package:flutter_foodstore/bloc/category/category_cubit.dart';
import 'package:flutter_foodstore/bloc/checkout/checkout_cubit.dart';
import 'package:flutter_foodstore/bloc/location/location_cubit.dart';
import 'package:flutter_foodstore/bloc/order/order_cubit.dart';
import 'package:flutter_foodstore/bloc/product/product_cubit.dart';
import 'package:flutter_foodstore/bloc/profile/profile_bloc.dart';
import 'package:flutter_foodstore/bloc/review_product/review_product_cubit.dart';
import 'package:flutter_foodstore/bloc/shipping_cost/shipping_cost_cubit.dart';
import 'package:flutter_foodstore/page/auth/login_page.dart';
import 'package:flutter_foodstore/page/auth/register_page.dart';
import 'package:flutter_foodstore/page/checkout/checkout_page.dart';
import 'package:flutter_foodstore/page/dashboard/cart_page.dart';
import 'package:flutter_foodstore/page/dashboard/dashboard_page.dart';
import 'package:flutter_foodstore/page/dashboard/home_page.dart';
import 'package:flutter_foodstore/page/dashboard/order_page.dart';
import 'package:flutter_foodstore/page/dashboard/profile_page.dart';
import 'package:flutter_foodstore/page/midtrans/midtrans_payment_page.dart';
import 'package:flutter_foodstore/page/order/order_detail_page.dart';
import 'package:flutter_foodstore/page/product/all_product_page.dart';
import 'package:flutter_foodstore/page/product/detail_product_page.dart';
import 'package:flutter_foodstore/page/product/product_by_category_page.dart';
import 'package:flutter_foodstore/page/search/search_page.dart';
import 'package:flutter_foodstore/resource/model/category_model.dart';
import 'package:flutter_foodstore/resource/remote/checkout_remote_resource.dart';
import 'package:flutter_foodstore/resource/remote/home_remote_resource.dart';
import 'package:flutter_foodstore/resource/remote/order_remote_resource.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;
  final OrderRemoteResource orderRemoteResource;
  final HomeRemoteResource homeRemoteResource;
  final CheckoutRemoteResource checkoutRemoteResource;

  AppRouter({
    required this.authBloc,
    required this.orderRemoteResource,
    required this.homeRemoteResource,
    required this.checkoutRemoteResource,
  });

  late final GoRouter router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: '/dashboard/home',
    redirect: (context, state) {
      final authState = authBloc.state;
      final isLoggedIn = authState is Authenticated;

      final protectedRoutes = [
        '/dashboard/order',
        '/dashboard/profile',
        '/dashboard/cart',
        '/order',
        '/checkout',
      ];

      final isProtected = protectedRoutes
          .any((route) => state.matchedLocation.startsWith(route));

      if (!isLoggedIn && isProtected) return '/login';

      if (isLoggedIn && state.matchedLocation == '/login') {
        return '/dashboard/home';
      }

      return null;
    },
    routes: [
      ShellRoute(
        builder: (_, __, child) => DashboardPage(child: child),
        routes: [
          GoRoute(
              path: '/dashboard/home',
              builder: (_, __) {
                return const HomePage();
              }),
          GoRoute(
              path: '/dashboard/order',
              builder: (context, state) {
                context.read<OrderCubit>().fetchOrders(isRefresh: true);
                return const OrderPage();
              }),
          GoRoute(
              path: '/dashboard/cart',
              builder: (context, state) {
                context.read<CartBloc>().add(const CartEvent.fetchCart());
                return const CartPage();
              }),
          GoRoute(
              path: '/dashboard/profile',
              builder: (context, state) {
                context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
                return const ProfilePage();
              }),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (_, __) => const RegisterPage(),
      ),
      GoRoute(
        path: '/orderDetail/:snapToken',
        builder: (context, state) {
          final snapToken = state.pathParameters['snapToken'] ?? '';
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    OrderCubit(orderRemoteResource)..detailOrder(snapToken),
              ),
              BlocProvider(
                create: (context) => ReviewProductCubit(
                  orderRemoteResource,
                ),
              ),
            ],
            child: const OrderDetailPage(),
          );
        },
      ),
      GoRoute(
        path: '/midtransPayment/:snapToken',
        builder: (context, state) {
          return MidtransPaymentPage(
            snapToken: state.pathParameters['snapToken'] ?? '',
          );
        },
      ),
      GoRoute(
        path: '/allProducts',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ProductCubit(homeRemoteResource)..fetchProduct(isRefresh: true),
          child: const AllProductPage(),
        ),
      ),
      GoRoute(
        path: '/detailProduct/:slug',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ProductCubit(homeRemoteResource)
              ..detailProduct(state.pathParameters['slug'] ?? ''),
            child: const DetailProductPage(),
          );
        },
      ),
      GoRoute(
        path: '/productByCategory',
        builder: (context, state) {
          final category = state.extra as CategoryModel;
          return BlocProvider(
            create: (context) => CategoryCubit(homeRemoteResource)
              ..fetchCategoryBySlug(category.slug ?? ''),
            child: ProductByCategoryPage(categoryName: category.name ?? ''),
          );
        },
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) {
          final String totalPrice =
              state.uri.queryParameters['totalPrice'] ?? '0';
          final String totalWeight =
              state.uri.queryParameters['totalWeight'] ?? '0';
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ShippingCostCubit(checkoutRemoteResource),
              ),
              BlocProvider(
                create: (context) => CheckoutCubit(checkoutRemoteResource),
              ),
              BlocProvider(
                create: (context) => LocationCubit(checkoutRemoteResource),
              ),
            ],
            child: CheckoutPage(
              totalPrice: int.parse(totalPrice),
              totalWeight: int.parse(totalWeight),
            ),
          );
        },
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) {
          final String query = state.uri.queryParameters['query'] ?? '';
          return BlocProvider(
            create: (context) =>
                ProductCubit(homeRemoteResource)..fetchProduct(query: query),
            child: const SearchPage(),
          );
        },
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream stream) {
    stream.listen((_) {
      notifyListeners();
    });
  }
}
