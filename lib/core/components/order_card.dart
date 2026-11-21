import 'package:flutter/material.dart';
import 'package:flutter_foodstore/core/utils/convert_date.dart';
import 'package:flutter_foodstore/core/utils/currency_helper.dart';
import 'package:flutter_foodstore/core/utils/utils.dart';
import 'package:flutter_foodstore/resource/model/order_model.dart';
import 'package:go_router/go_router.dart';

class OrderCard extends StatefulWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () => context.push('/orderDetail/${widget.order.snapToken}'),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.shopping_basket_outlined),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      '${widget.order.invoice}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    widget.order.status.toString().capitalize(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: widget.order.status == 'success'
                          ? Colors.green
                          : widget.order.status == 'pending'
                              ? Colors.orange
                              : Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                  'Date: ${ConvertDate.convertDate(widget.order.createdAt.toString())}'),
              const SizedBox(height: 4),
              Text(
                  'Total: ${CurrencyHelper.formatRupiah(widget.order.total?.toDouble() ?? 0)}'),
            ],
          ),
        ),
      ),
    );
  }
}
