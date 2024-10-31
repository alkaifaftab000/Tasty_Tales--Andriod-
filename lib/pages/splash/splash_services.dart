import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tasty_reciepes/pages/home.dart';

class SplashService{
  void isUserLoggedIn(BuildContext context){
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
}