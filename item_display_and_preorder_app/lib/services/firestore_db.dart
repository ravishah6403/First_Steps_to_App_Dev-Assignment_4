import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:item_display_and_preorder_app/models/item_model.dart';

class DatabaseRepository {
  static final _db = FirebaseFirestore.instance;

  Future<List<Item>> getItems() async {
    final querySnapshot = await _db.collection('Electronics').get();
    return querySnapshot.docs
        .map((docSnapshot) => Item.fromFirestore(docSnapshot))
        .toList();
  }
}
