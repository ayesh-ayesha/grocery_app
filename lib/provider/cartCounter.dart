import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid_project/main.dart';
import 'package:mid_project/models/orders.dart';


import '../models/products.dart';
import '../objectbox.g.dart';

class CartCounter extends ChangeNotifier {



  List<OrderItem> itemCart = objectBoxDatabase.orderTable.getAll();
  List<Product> favoritearr=[];
  //this will be a database table
  // List<Product> itemCart=objectBoxDatabase.productTable.getAll();
  // List<FavoritesItem> favoritearr=objectBoxDatabase.favoriteTable.getAll();




  int count = 0;

// Future<void>
  void AddToCart(Product product) {
    // Check if the product already exists in the cart
    final existingItem = objectBoxDatabase.orderTable
        .query(OrderItem_.name.equals(product.name)) // you can also match by productId if you have it
        .build()
        .findFirst();

    if (existingItem != null) {
      // Already in cart, increase quantity
      existingItem.quantity += 1;
      count=count;
      objectBoxDatabase.orderTable.put(existingItem);

    } else {
      // Not in cart, create new entry
      final order = OrderItem(
        name: product.name,
        image: product.image,
        actualPrize: product.actualPrize,
        quantity: 1,
      );
      objectBoxDatabase.orderTable.put(order);
      count++;
    }

    product.isAddedToCart = true;
    objectBoxDatabase.productTable.put(product);


    notifyListeners();
  }



  void RemoveFromCart(OrderItem item) {
    // Remove from ObjectBox orderTable using the ID
    objectBoxDatabase.orderTable.remove(item.id);

    // Update the isAddedToCart flag in the original product (optional: if you want to reflect this)
    final product = objectBoxDatabase.productTable.get(item.id);
    if (product != null) {
      product.isAddedToCart = false;
      objectBoxDatabase.productTable.put(product);
    }

    // Decrease the counter
    count--;
    notifyListeners();
  }

  void increaseQuantity(OrderItem item) {
    item.quantity += 1;
    objectBoxDatabase.orderTable.put(item); // update in ObjectBox
    notifyListeners();
  }

  void decreaseQuantity(OrderItem item) {
    if (item.quantity > 1) {
      item.quantity -= 1;
      objectBoxDatabase.orderTable.put(item); // update in ObjectBox
      notifyListeners();
    } else {
      // If quantity is 1, remove it instead
      RemoveFromCart(item);
    }
  }

  void AddToFavorite(Product item) {
    if (!favoritearr.contains(item)) {
      favoritearr.add(item);
      item.isFavorite=true;
      notifyListeners();
    }else{
      favoritearr.remove(item);
      item.isFavorite=false;

      notifyListeners();

    }
  }



}
