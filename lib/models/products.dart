import 'package:objectbox/objectbox.dart';

@Entity()
class Product{
  @Id()
  int id;
  String name;
  String image;
  int actualPrize;
  int discountedPrize;
  String category;
  bool isAddedToCart=false;
  bool isFavorite=false;

  Product({this.id=0, required this.name, required this.image, required this.actualPrize,
    required this.discountedPrize, required this.category, required this.isAddedToCart,
    required this.isFavorite});




}