import 'package:flutter/material.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight + 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(color: Colors.black, child: Text("Total 6 products/6 items")),
                Text("₹400"),
              ],
            ),
            ElevatedButton(onPressed: (){}, child: Text("Checkout"), style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent))
          ],
        ),
      ),
    );
  }
}
