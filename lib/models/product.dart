import 'package:flutter_ecommerce_tarek/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imaUrl;
  final int discountValue;
  final String category;
  final int? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imaUrl,
    this.discountValue = 0,
    this.category = 'Other',
    this.rate,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imaUrl,
      'discountValue': discountValue,
      'category': category,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imaUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
      rate: map['rate'] as int,
    );
  }
}

List<Product> dummyProducts = [
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
  Product(
    id: 'id',
    title: 'T-shirt',
    price: 300,
    imaUrl: AppAssets.tempProductAsset1,
    category: 'Clothers',
    discountValue: 20,
  ),
];
