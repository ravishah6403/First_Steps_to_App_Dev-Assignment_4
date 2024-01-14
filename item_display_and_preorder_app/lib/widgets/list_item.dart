import 'package:flutter/material.dart';
import 'package:item_display_and_preorder_app/models/item_model.dart';
import 'package:item_display_and_preorder_app/pages/details_page.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(item: item))),
                child: const Text(
                  'PREORDER',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
