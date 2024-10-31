import 'package:flutter/material.dart';
import 'package:tasty_reciepes/pages/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  final splashServices = SplashService();
  @override
  void initState() {
    splashServices.isUserLoggedIn(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ss = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: const AssetImage('assets/s2.gif'),height:ss.height*.5,width:ss.width*.6),
            const SizedBox(height: 30),
            const Text('Tasty 🍉 Tales',style: TextStyle(fontSize: 40,fontFamily: 'Funky02')),
            const SizedBox(height: 20),
            const Text('Every Delicious😋 Dish Tell a Beautiful Story🥕',style: TextStyle(fontSize: 25,fontFamily: 'Funky02'),textAlign: TextAlign.center,)
          ]))
    );
  }
}
