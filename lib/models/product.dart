import 'package:flutter_ecommerce_tarek/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imaUrl;
  final int discountValue;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imaUrl,
    this.discountValue = 0,
    this.category = 'Other',
    this.rate,
  });
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
