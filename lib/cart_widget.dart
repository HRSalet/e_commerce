import 'package:e_commerce/quantity_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required List<Map<String, String>> cartItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage('assets/shirts/shirt3.png'),
                height: size.height * 0.2,
                width: size.width * 0.2,
              ),
              Column(
                children: [
                  Text("Product 1"),
                  OutlinedButton.icon(
                    onPressed: () async{
                      await showModalBottomSheet(context: context, builder: (context){
                        return QuantityBottomSheetWidget();
                      });
                    },
                    label: Text("Qty: 7"), icon: Icon(Icons.arrow_drop_down_sharp),)
                ],
              ),
              Text("₹200"),
              Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.red,),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage('assets/shirts/shirt5.png'),
                height: size.height * 0.2,
                width: size.width * 0.2,
              ),
              Column(
                children: [
                  Text("Product 2"),
                  OutlinedButton.icon(
                    onPressed: () async{
                      await showModalBottomSheet(context: context, builder: (context){
                        return QuantityBottomSheetWidget();
                      });
                    },
                    label: Text("Qty: 7"), icon: Icon(Icons.arrow_drop_down_sharp),)
                ],
              ),
              Text("₹200"),
              Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.red,)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
