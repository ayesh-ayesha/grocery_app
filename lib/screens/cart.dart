import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mid_project/provider/cartCounter.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widgets/listItem.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartItemsStream =
  objectBoxDatabase.orderTable.query().watch(triggerImmediately: true);

  void showCheckOutDialog(BuildContext context) {
    TextEditingController dialogueController = TextEditingController();
    String numberError = "";

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text("Enter your number"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: dialogueController,
                  decoration: const InputDecoration(
                    hintText: "Enter your WhatsApp number",
                  ),
                ),
                if (numberError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      numberError,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  String inputText = dialogueController.text;
                  if (inputText.isEmpty || inputText.length < 11) {
                    setState(() {
                      numberError =
                      "Please enter a valid number (at least 11 digits)";
                    });
                  } else {
                    Navigator.of(context).pop();
                    // Handle your order logic here
                  }
                },
                child: const Text(
                  "Check Out",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.shopping_cart, size: 28),
                Positioned(
                  right: 0,
                  top: 4,
                  child: Consumer<CartCounter>(
                    builder: (context, cartCounter, child) {
                      return cartCounter.count > 0
                          ? Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          '${cartCounter.count}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                          : const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: cartItemsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var cartItems = snapshot.data!.find();

          if (cartItems.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return OrderListItem(item: cartItems[index]);
            },
          );
        },
      ),
    );
  }
}
