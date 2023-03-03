import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:milktea/screen/widget/appbar_name_widget.dart';
import 'package:milktea/screen/widget/product_card_widget.dart';

import '../provider/category_controller.dart';
import '../provider/product_controller.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(allCategoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final products = ref.watch(allProductsProvider);

    return Scaffold(
      appBar: const AppbarName(
        name: 'Menu',
        showBadge: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            categories.when(
              error: (err, s) => Text('Errors: $err'),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (categories) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            ref.read(selectedCategoryProvider.notifier).setSelectedCategory(categories[index]);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: selectedCategory == categories[index] ? const Color(0xffFB9116) : const Color(0xff757575), width: 1),
                              borderRadius: BorderRadius.circular(50),
                              color: selectedCategory == categories[index] ? const Color(0xffFB9116) : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 16,
                                  color: selectedCategory == categories[index] ? Colors.white : const Color(0xff171717),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            products.when(
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (products) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(product: products[index], cardWidth: 170, cardHeight: 210);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
