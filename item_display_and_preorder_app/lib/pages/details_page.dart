import 'package:flutter/material.dart';
import 'package:item_display_and_preorder_app/models/item_model.dart';
import 'package:item_display_and_preorder_app/widgets/button_custom.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Product ID: ${item.id}',
            style: TextStyle(color: Colors.grey.shade400),
          ),
          const SizedBox(height: 70),
          Text(
            'Price: Rs ${item.price}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ButtonCustom(text: 'DONE', function: () => Navigator.pop(context))
        ]),
      )),
    );
  }
}
