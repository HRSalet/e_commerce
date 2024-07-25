import 'package:flutter/material.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/wishlist.dart';
import 'package:e_commerce/shopping_cart.dart';  // Import ShoppingCart

class CategoryProductsPage extends StatefulWidget {
  final String category;

  CategoryProductsPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryProductsPageState createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  final Map<String, List<Map<String, String>>> categoryProducts = {
    'Mens': [
      {'name': 'Red T-shirt', 'image': 'assets/shirts/shirt1.png', 'price': '₹450'},
      {'name': 'Black Hoodie', 'image': 'assets/shirts/shirt2.png', 'price': '₹600'},
      {'name': 'Blue T-shirt', 'image': 'assets/shirts/shirt3.png', 'price': '₹300'},
      {'name': 'Lime T-shirt', 'image': 'assets/shirts/shirt4.png', 'price': '₹400'},
      {'name': 'Cyan T-shirt', 'image': 'assets/shirts/shirt5.png', 'price': '₹350'},
      {'name': 'Grey T-shirt', 'image': 'assets/shirts/shirt6.png', 'price': '₹250'},
    ],
    'Ladies': [
      {'name': 'Yellow Dress', 'image': 'assets/dress/dress1.png', 'price': '₹700'},
      {'name': 'Pink Dress', 'image': 'assets/dress/dress2.png', 'price': '₹650'},
      {'name': 'Purple Dress', 'image': 'assets/dress/dress3.png', 'price': '₹450'},
      {'name': 'White Dress', 'image': 'assets/dress/dress4.png', 'price': '₹500'},
      {'name': 'Silver Dress', 'image': 'assets/dress/dress5.png', 'price': '₹550'},
      {'name': 'Combo Dress', 'image': 'assets/dress/dress6.png', 'price': '₹800'},
    ],
    'Shoes': [
      {'name': 'Black Shoes', 'image': 'assets/shoes/shoes1.png', 'price': '₹700'},
      {'name': 'Maroon Shoes', 'image': 'assets/shoes/shoes2.png', 'price': '₹800'},
      {'name': 'Red Shoes', 'image': 'assets/shoes/shoes3.png', 'price': '₹600'},
      {'name': 'Heels', 'image': 'assets/shoes/shoes4.png', 'price': '₹550'},
      {'name': 'Sandals', 'image': 'assets/shoes/shoes5.png', 'price': '₹400'},
      {'name': 'Baby Shoes', 'image': 'assets/shoes/shoes6.png', 'price': '₹350'},
    ],
    'Hats': [
      {'name': 'Cap Alpha', 'image': 'assets/caps/cap1.png', 'price': '₹200'},
      {'name': 'Cap Beta', 'image': 'assets/caps/cap2.png', 'price': '₹300'},
      {'name': 'Cap Gamma', 'image': 'assets/caps/cap3.png', 'price': '₹450'},
      {'name': 'Cap Delta', 'image': 'assets/caps/cap4.png', 'price': '₹400'},
      {'name': 'Cap Sigma', 'image': 'assets/caps/cap5.png', 'price': '₹350'},
      {'name': 'Cap Epsilon', 'image': 'assets/caps/cap6.png', 'price': '₹500'},
    ],
  };

  final Set<Map<String, String>> selectedProducts = {};
  final Set<Map<String, String>> wishlistProducts = {};

  @override
  Widget build(BuildContext context) {
    final products = categoryProducts[widget.category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Products'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductGridTile(
                  product: product,
                  isSelected: selectedProducts.contains(product),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedProducts.add(product);
                      } else {
                        selectedProducts.remove(product);
                      }
                    });
                  },
                  onWishlist: () {
                    setState(() {
                      if (!wishlistProducts.contains(product)) {
                        wishlistProducts.add(product);
                      } else {
                        wishlistProducts.remove(product);
                      }
                    });
                  },
                  isWishlist: wishlistProducts.contains(product),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: selectedProducts.isNotEmpty
                    ? () => _navigateToCart(context, selectedProducts.toList())
                    : null,
                child: Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: wishlistProducts.isNotEmpty
                    ? () => _navigateToWishlist(context, wishlistProducts.toList())
                    : null,
                child: Text('View Wishlist'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToWishlist(BuildContext context, List<Map<String, String>> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WishlistPage(
          wishlistProducts: products,
        ),
      ),
    );
  }

  void _navigateToCart(BuildContext context, List<Map<String, String>> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingCart(
          category: widget.category,
          products: products,
        ),
      ),
    );
  }
}

class ProductGridTile extends StatelessWidget {
  final Map<String, String> product;
  final bool isSelected;
  final bool isWishlist;
  final ValueChanged<bool> onSelected;
  final VoidCallback onWishlist;

  const ProductGridTile({
    Key? key,
    required this.product,
    required this.isSelected,
    required this.onSelected,
    required this.onWishlist,
    required this.isWishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (bool? value) {
                    onSelected(value!);
                  },
                ),
                IconButton(
                  icon: Icon(isWishlist ? Icons.favorite : Icons.favorite_border),
                  color: Colors.white,
                  onPressed: onWishlist,
                ),
              ],
            ),
          ],
        ),
      ),
      child: Image.asset(
        product['image']!,
        fit: BoxFit.cover,
      ),
    );
  }
}

