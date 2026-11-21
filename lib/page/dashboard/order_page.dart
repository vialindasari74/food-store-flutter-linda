import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/order/order_cubit.dart';
import 'package:flutter_foodstore/core/components/order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loadedOrder: (orders, hasMore) => orders.isEmpty
              ? const Center(child: Text("No Data Order"))
              : ListView.builder(
                  itemCount: orders.length + (hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= orders.length) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 5,
                          bottom: 16,
                        ),
                        child: FilledButton(
                          onPressed: () {
                            context.read<OrderCubit>().fetchOrders();
                          },
                          child: const Text(
                            "Load More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                    final order = orders[index];
                    return OrderCard(order: order);
                  },
                ),
          orElse: () => const Center(child: Text('Something went wrong')),
        );
      },
    );
  }
}
