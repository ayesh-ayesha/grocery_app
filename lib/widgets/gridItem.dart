import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import '../provider/cartCounter.dart';

class GridItem extends StatelessWidget {
  final Product item;

  const GridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(item.image, height: 70)),
            const SizedBox(height: 10),
            Center(
              child: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${item.discountedPrize}',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Consumer<CartCounter>(
                  builder: (context, cart, child) {
                    return IconButton(
                      onPressed: () {
                        cart.AddToCart(item);
                      },
                      icon: const Icon(Icons.add, size: 18),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${item.actualPrize}',
                  style: const TextStyle(fontSize: 14),
                ),
                Consumer<CartCounter>(
                  builder: (context, favorite, child) {
                    bool isFavorite = favorite.favoritearr.contains(item);
                    return IconButton(
                      onPressed: () {
                        favorite.AddToFavorite(item);
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
