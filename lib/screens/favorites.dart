import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cartCounter.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartCounter>(
      builder: (context, favorite, child) {
        final favoriteList = favorite.favoritearr;

        if (favoriteList.isEmpty) {
          return const Center(child: Text('No favorite items yet.'));
        }

        return ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (context, index) {
            final item = favoriteList[index];

            return ListTile(
              leading: Image.asset(
                item.image, // make sure `imageUrl` is a valid field in your Product class
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item.name),
              subtitle: Text('Price: \$${item.actualPrize.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  favorite.AddToFavorite(item);
                },
              ),
            );
          },
        );
      },
    );
  }
}
