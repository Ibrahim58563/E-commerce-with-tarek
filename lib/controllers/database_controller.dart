import 'package:flutter_ecommerce_tarek/models/product.dart';
import 'package:flutter_ecommerce_tarek/services/firestore_services.dart';

abstract class Database {
  Stream<List<Product>> salesProductStream();
  Stream<List<Product>> newProductStream();
}

class FirestoreDatabase implements Database {
  final String uid;
  final _service = FirestoreServices.instance;

  FirestoreDatabase(this.uid);
  @override
  Stream<List<Product>> salesProductStream() => _service.collectionsStream(
      path: 'products/',
      builder: (data, documentId) => Product.fromMap(data!, documentId),
      queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0));
  @override
  Stream<List<Product>> newProductStream() => _service.collectionsStream(
        path: 'products/',
        builder: (data, documentId) => Product.fromMap(data!, documentId),
      );
}
