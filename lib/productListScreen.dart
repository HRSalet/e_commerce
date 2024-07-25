import 'package:e_commerce/shopping_cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final String category;
  final List<Map<String, String>> items;

  ProductListScreen({required this.category, required this.items});

  void _navigateToProductDetail(BuildContext context, Map<String, String> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingCart(products: items, category: '',),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Products'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final product = items[index];
            // print(index);
            return GestureDetector(
              onTap: () => _navigateToProductDetail(context, product),
              child: Column(
                children: [
                  Image.asset(product['image']!),
                  Text(product['name']!),
                  Text(product['price']!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
