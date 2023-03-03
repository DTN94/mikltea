import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final double cardWidth;
  final double cardHeight;

  const ProductCard({
    required this.cardHeight,
    required this.cardWidth,
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
          context.namedLocation('product', params: <String, String>{'id': product.id.toString()}),
        );
      },
      child: Container(
        width: cardWidth,
        height: cardHeight,
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 95,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: CachedNetworkImage(
                  imageUrl: (Uri.tryParse(product.photo)!.hasAbsolutePath == true) ? product.photo : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              product.name,
              style: const TextStyle(fontFamily: 'Oswald', fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff222222)),
            ),
            Text(
              NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(product.regularPrice),
              style: const TextStyle(
                fontFamily: 'Oswald',
                fontSize: 14,
                color: Color(0xffFB9116),
              ),
            )
          ],
        ),
      ),
    );
  }
}
