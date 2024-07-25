import 'package:e_commerce/constants.dart';
import 'package:e_commerce/home_body.dart';
import 'package:e_commerce/profile.dart';
import 'package:e_commerce/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce/wishlist.dart';

class MyHomeScreen extends StatefulWidget {

  @override
  State<MyHomeScreen> createState() => _MyHomeScreen();
}

class _MyHomeScreen extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: HomeBody(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [BoxShadow(
            color: Color(0xFFDADADA),
            offset: Offset(0, -15),
            blurRadius: 20,
          )
          ]),
        child: SafeArea(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomeScreen()));
              },
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/heart.svg'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => WishlistPage(wishlistProducts: [],)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/shopping_cart.svg'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => ShoppingCart(products: [], category: '',)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/user.svg'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => UserProfile()));
              },
            ),
          ],
        )),
      ),
    );
  }
}
