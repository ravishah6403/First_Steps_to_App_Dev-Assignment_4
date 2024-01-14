import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String name;
  int price;

  Item({required this.id, required this.name, required this.price});

  factory Item.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Item(id: snapshot.id, name: data?['Name'], price: data?['Price']);
  }
}
