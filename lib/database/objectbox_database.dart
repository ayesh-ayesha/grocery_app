
import 'package:mid_project/models/favorites.dart';

import '../models/orders.dart';
import '../models/products.dart';
import '../objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ObjectBoxDatabase {
  Store store;
 late Box<Product> productTable;
 late Box<OrderItem> orderTable;
 late Box<FavoritesItem> favoriteTable;
 static  ObjectBoxDatabase? objectBoxDatabase;


  ObjectBoxDatabase(this.store){
    productTable=store.box<Product>();
    orderTable=store.box<OrderItem>();
     favoriteTable=store.box<FavoritesItem>();
  }


static Future<ObjectBoxDatabase> create()async{
    if(objectBoxDatabase!=null) return objectBoxDatabase!;
  final docsDir = await getApplicationDocumentsDirectory();

  Store store= await  openStore(directory: p.join(docsDir.path,'grocerystore_v4'));
  objectBoxDatabase= ObjectBoxDatabase(store);
  return objectBoxDatabase!;
}

}