import 'package:objectbox/objectbox.dart';

@Entity()
class FavoritesItem {
  @Id()
  int id;

  String name;
  String image;
  int actualPrize;
  int discountedPrize;
  String category;
  int quantity;

  bool isAddedToCart;
  bool isFavorite;

  FavoritesItem({
    this.id = 0, // default 0 so ObjectBox can assign it
    required this.name,
    required this.image,
    required this.actualPrize,
    required this.discountedPrize,
    required this.category,
    this.quantity = 1,
    this.isAddedToCart = false,
    this.isFavorite = false,
  });
}
