import 'package:flutter/material.dart';

class CheckoutRow extends StatelessWidget {

  final String title;
  final String value;
  final VoidCallback onPressed;

  const CheckoutRow({super.key, required this.title, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Row(
              children: [
                Text(title,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight:FontWeight.w600),),
                Expanded(child: Text(value,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight:FontWeight.w600
                  ),),),
                const SizedBox(width: 15,),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded))
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black26,
          height: 1,
        ),
      ],
    );
  }
}
