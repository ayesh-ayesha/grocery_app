import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/orders.dart';
import '../provider/cartCounter.dart';

class OrderListItem extends StatelessWidget {
  final OrderItem item;

  const OrderListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(item.image, height: 70),
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${item.actualPrize.toString()}'),
            const SizedBox(height: 4),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (item.quantity > 1) {
                      Provider.of<CartCounter>(context, listen: false)
                          .decreaseQuantity(item);
                    }
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                Text(item.quantity.toString()),
                IconButton(
                  onPressed: () {
                    Provider.of<CartCounter>(context, listen: false)
                        .increaseQuantity(item);
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline, size: 20),
          onPressed: () {
            Provider.of<CartCounter>(context, listen: false)
                .RemoveFromCart(item);
          },
        ),
      ),
    );
  }
}
