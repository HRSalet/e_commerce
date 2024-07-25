import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class RecentProducts extends StatelessWidget {

  final productList = [
    {
      'name': 'White Cotton Shirt',
      'image': 'assets/products/rcentImg1.png',
      'price': 120,
      'desc': 'Material: Georgette; Comfortable and Breathable to wear',
    },
    {
      'name': 'Red T-Shirt',
      'image': 'assets/products/rcentImg2.png',
      'price': 150,
      'desc': 'Material: Georgette; Comfortable and Breathable to wear',
    },
    {
      'name': 'Black T-Shirt',
      'image': 'assets/products/rcentImg3.png',
      'price': 150,
      'desc': 'Material: Georgette; Comfortable and Breathable to wear',
    },
    {
      'name': 'Full sleeve T-Shirt',
      'image': 'assets/products/rcentImg4.png',
      'price': 200,
      'desc': 'Material: Georgette; Comfortable and Breathable to wear',
    },
    {
      'name': 'Nike Shoes',
      'image': 'assets/products/rcentImg5.png',
      'price': 1100,
      'desc': 'Material: Georgette; Comfortable and Breathable to wear',
    },
    {
      'name': 'Children Shoes',
      'image': 'assets/products/rcentImg6.png',
      'price': 120,
      'desc': 'Material: Georgette; Comfortable and Breathable to wear',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.70),
      itemBuilder: (BuildContext context,int index){
        return RecentSingleProducts(
          recent_single_prod_desc: productList[index]['desc'],
          recent_single_prod_name: productList[index]['name'],
          recent_single_prod_image: productList[index]['image'],
          recent_single_prod_price: productList[index]['price'],
        );
      }
    );
  }
}

class RecentSingleProducts extends StatefulWidget {

  final recent_single_prod_name;
  final recent_single_prod_image;
  final recent_single_prod_price;
  final recent_single_prod_desc;

  RecentSingleProducts({
    this.recent_single_prod_name,
    this.recent_single_prod_image,
    this.recent_single_prod_price,
    this.recent_single_prod_desc,
  });

  @override
  State<RecentSingleProducts> createState() => _RecentSingleProductsState();
}

class _RecentSingleProductsState extends State<RecentSingleProducts> {
  bool isLike = false;
  final Color inactiveColor = Colors.black38;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 160,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Image.asset(widget.recent_single_prod_image),
        ),
        ListTile(
          title: Text(widget.recent_single_prod_name),
          subtitle: Text('\₹${widget.recent_single_prod_price}'),
          trailing: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(
              icon: Icon(
                isLike ? Icons.favorite:Icons.favorite_outline_outlined,
                size: 15,
                color: isLike? Colors.red: inactiveColor,
              ),
              onPressed: (){
                setState(() {
                  isLike = !isLike;
                });
              },
            ),
          )
        ),
      ],
    );
  }
}

