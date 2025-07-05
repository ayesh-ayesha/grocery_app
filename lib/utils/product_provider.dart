
import 'package:mid_project/models/products.dart';

import '../main.dart';



class DummyProductProvider {

 static List<Product> getProducts() {
   objectBoxDatabase.productTable.putMany(

        [
         // objectBoxDatabase.productTable.put(
         Product(
           // id=1,
           name: "Cauliflower",
           image: "assets/images/cooliflower.png",
           actualPrize: 12,
           discountedPrize: 10,
           category: "vegetables",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         //  objectBoxDatabase.productTable.put(
         Product(
           // id: 2,
           name: "Egg Plant",
           image: "assets/images/Eggplant.png",
           actualPrize: 12,
           discountedPrize: 13,
           category: "vegetable",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         // objectBoxDatabase.productTable.put(
         Product(
           // id: 3,
           name: "Onion",
           image: "assets/images/Onion.png",
           actualPrize: 12,
           discountedPrize: 10,
           category: "vegetables",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         // objectBoxDatabase.productTable.put(
         Product(
           // id: 1,
           name: "Apple",
           image: "assets/images/apple.png",
           actualPrize: 12,
           discountedPrize: 10,
           category: "fruits",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         // objectBoxDatabase.productTable.put(
         Product(
           // id: 2,
           name: "Banana",
           image: "assets/images/banana.png",
           actualPrize: 12,
           discountedPrize: 13,
           category: "fruits",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         // objectBoxDatabase.productTable.put(
         Product(
           // id: 3,
           name: "Mangoes",
           image: "assets/images/Mangoes.png",
           actualPrize: 12,
           discountedPrize: 10,
           category: "fruits",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         // objectBoxDatabase.productTable.put(
         Product(
           // id: 1,
           name: "Bread",
           image: "assets/images/bread.png",
           actualPrize: 12,
           discountedPrize: 10,
           category: "bakeryItems",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         // objectBoxDatabase.productTable.put(
         Product(
           // id: 2,
           name: "Butter",
           image: "assets/images/butter.png",
           actualPrize: 12,
           discountedPrize: 13,
           category: "bakeryItems",
           isAddedToCart: false,
           isFavorite: false,
         ),
         // ) ,
         // objectBoxDatabase.productTable.put(
         Product(
           // id: 3,
           name: "Eggs",
           image: "assets/images/eggs.png",
           actualPrize: 12,
           discountedPrize: 10,
           category: "bakeryItems",
           isAddedToCart: false,
           isFavorite: false,),
         // ) ,
       ]

     // objectBoxDatabase.productTable.putMany(items);
   );
   return objectBoxDatabase.productTable.getAll();
// }
//
//
//
// static Future<List<Product>> getProducts() async {
//   return objectBoxDatabase.productTable.getAll();
// }
 }
}

//
// class DummyProductProvider {
//   // Method to insert dummy products (only once if needed)
//   static Future<void> insertDummyProducts() async {
//     await objectBoxDatabase.productTable.putMany([
//       Product(name: "Cauliflower", image: "assets/images/cooliflower.png", actualPrize: 12, discountedPrize: 10, category: "vegetables", isAddedToCart: false, isFavorite: false),
//       Product(name: "Egg Plant", image: "assets/images/Eggplant.png", actualPrize: 12, discountedPrize: 13, category: "vegetable", isAddedToCart: false, isFavorite: false),
//       Product(name: "Onion", image: "assets/images/Onion.png", actualPrize: 12, discountedPrize: 10, category: "vegetables", isAddedToCart: false, isFavorite: false),
//       Product(name: "Apple", image: "assets/images/apple.png", actualPrize: 12, discountedPrize: 10, category: "fruits", isAddedToCart: false, isFavorite: false),
//       Product(name: "Banana", image: "assets/images/banana.png", actualPrize: 12, discountedPrize: 13, category: "fruits", isAddedToCart: false, isFavorite: false),
//       Product(name: "Mangoes", image: "assets/images/Mangoes.png", actualPrize: 12, discountedPrize: 10, category: "fruits", isAddedToCart: false, isFavorite: false),
//       Product(name: "Bread", image: "assets/images/bread.png", actualPrize: 12, discountedPrize: 10, category: "bakeryItems", isAddedToCart: false, isFavorite: false),
//       Product(name: "Butter", image: "assets/images/butter.png", actualPrize: 12, discountedPrize: 13, category: "bakeryItems", isAddedToCart: false, isFavorite: false),
//       Product(name: "Eggs", image: "assets/images/eggs.png", actualPrize: 12, discountedPrize: 10, category: "bakeryItems", isAddedToCart: false, isFavorite: false),
//     ]);
//   }
//
//   // 🔥 This gives a stream of product list
//   static Stream<List<Product>> getProductStream() {
//     return objectBoxDatabase.productTable.query().watch(triggerImmediately: true).map((query) => query.find());
//   }
//
// }





