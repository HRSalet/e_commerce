import 'package:flutter/material.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.blueGrey
          ),
        ),
        SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                print("index ${index + 1}");
              },
                child: Center(child: Text("${index+1}")),
            );
          }),
        ),
      ],
    );
  }
}
