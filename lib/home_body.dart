import 'package:e_commerce/categories.dart';
import 'package:e_commerce/profile.dart';
import 'package:e_commerce/recent_products.dart';
import 'package:e_commerce/slider.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.dashboard),
                        onPressed: (){
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text('Home',style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.account_circle),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                      },
                      iconSize: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4)
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.search),
                              )),
                          )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ProductSlider(),
              SizedBox(height: 20,),
              Categories(),
              SizedBox(height: 20,),
              Container(height: 300,child: RecentProducts()),
            ],
          ),
        ),
      ),
    );
  }
}
