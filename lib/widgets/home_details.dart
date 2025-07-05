import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mid_project/utils/product_provider.dart';

import 'gridItem.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  var items = DummyProductProvider.getProducts();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 4,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GridItem(item: items[index]);
      },
    );
  }
}


//
// class HomeDetails extends StatefulWidget {
//   const HomeDetails({super.key});
//
//   @override
//   State<HomeDetails> createState() => _HomeDetailsState();
// }
//
// class _HomeDetailsState extends State<HomeDetails> {
//   @override
//   void initState() {
//     super.initState();
//     DummyProductProvider.insertDummyProducts(); // Only for the first time to insert dummy data
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Product>>(
//       stream: DummyProductProvider.getProductStream(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No products available'));
//         }
//
//         final items = snapshot.data!;
//
//         return GridView.builder(
//           padding: const EdgeInsets.all(10),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//             childAspectRatio: 2 / 4,
//           ),
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return GridItem(item: items[index]);
//           },
//         );
//       },
//     );
//   }
// }









