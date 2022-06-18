import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_tarek/models/product.dart';
import 'package:flutter_ecommerce_tarek/utilities/assets.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    product.imaUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 50,
                    height: 30,
                    child: DecoratedBox(
                      child: Center(
                        child: Text(
                          '${product.discountValue}%',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              product.category,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              product.title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              '${product.price}\$',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
