import 'package:flutter/material.dart';
import 'package:mid_project/utils/product_provider.dart';

import '../widgets/gridItem.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  var items=DummyProductProvider.getProducts();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 4,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GridItem(item: items[index]);
        },
      ),
    );
  }
}





