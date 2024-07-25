import 'package:flutter/material.dart';
import 'package:e_commerce/constants.dart';
import 'category_products_page.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryProducts(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductsPage(category: 'Mens'),
                ),
              );
            },
            image: 'assets/products/fashion_mens_shirt.png',
            text: 'Mens',
          ),
          const SizedBox(width: 10),
          CategoryProducts(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductsPage(category: 'Ladies'),
                ),
              );
            },
            image: 'assets/products/fashion_ladies_dress.png',
            text: 'Ladies',
          ),
          const SizedBox(width: 10),
          CategoryProducts(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductsPage(category: 'Shoes'),
                ),
              );
            },
            image: 'assets/products/fashion_shoe.png',
            text: 'Shoes',
          ),
          const SizedBox(width: 10),
          CategoryProducts(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductsPage(category: 'Hats'),
                ),
              );
            },
            image: 'assets/products/fashion_hat.png',
            text: 'Hats',
          ),
        ],
      ),
    );
  }
}

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String image;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: press,
        child: Chip(
          backgroundColor: kPrimaryColor,
          label: Row(
            children: [
              Image.asset(
                image,
                height: 40,
              ),
              const SizedBox(width: 10),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
