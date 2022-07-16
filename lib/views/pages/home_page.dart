import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_tarek/models/product.dart';
import 'package:flutter_ecommerce_tarek/utilities/assets.dart';
import 'package:flutter_ecommerce_tarek/views/widgets/list_item_home.dart';
import 'package:provider/provider.dart';

import '../../controllers/database_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  /// TODO: Temp code till refactor to a separate class with a spearate context
  Widget _buildHeaderOfList(
    BuildContext context, {
    required String title,
    required String description,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'View all',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
              ),
            )
          ],
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.grey,
              ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppAssets.topBannerHomePageAsset,
                width: double.infinity,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: size.height * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                _buildHeaderOfList(
                  context,
                  title: 'Sale',
                  description: 'Super Summer Sale!',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 300,
                  child: StreamBuilder<List<Product>>(
                      stream: database.salesProductStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text("No Data Available"),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: products[index]),
                            ),
                            itemCount: products.length,
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                _buildHeaderOfList(
                  context,
                  title: 'New',
                  description: 'Super New Products!',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 300,
                  child: StreamBuilder<List<Product>>(
                      stream: database.newProductStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text("No Data Available"),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(product: products[index]),
                            ),
                            itemCount: products.length,
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
