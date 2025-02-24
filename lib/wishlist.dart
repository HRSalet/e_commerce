import 'package:flutter/material.dart';
import 'package:e_commerce/constants.dart';

class WishlistPage extends StatelessWidget {
  final List<Map<String, String>> wishlistProducts;

  const WishlistPage({Key? key, required this.wishlistProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist page'),
        backgroundColor: kPrimaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8, // Adjust the aspect ratio as needed
        ),
        itemCount: wishlistProducts.length,
        itemBuilder: (context, index) {
          final product = wishlistProducts[index];
          return GridTile(
            footer: Container(
              color: Colors.black54,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product['name']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    product['price']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            child: Image.asset(
              product['image']!,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
