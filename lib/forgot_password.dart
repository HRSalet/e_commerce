import 'dart:async';
import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/forgotBG.jpg'),fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("We have send you an email to recover your password")),
                    );
                  }).onError((error, stackTrace){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${error.toString()}")),
                    );
                  });
                },
                child: Text("Forgot")
            )
          ],
        ),
      ),
    );
  }
}
