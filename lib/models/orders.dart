import 'package:objectbox/objectbox.dart';

@Entity()
class OrderItem {
  @Id()
  int id;

  String name;
  String image;
  int actualPrize;
  int quantity;
  bool isAddedToCart;

  OrderItem({
    this.id = 0,
    required this.name,
    required this.image,
    required this.actualPrize,
    required this.quantity,
    this.isAddedToCart=true,
  });
}
