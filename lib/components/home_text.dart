import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeText extends StatelessWidget {
  HomeText({super.key});

  final List<String> foodItems = [
    'Burger',
    'Biryani',
    'Manchurian',
    'French Fries',
    'Pizza',
    'Mutton Dishes',
    'Chicken Dishes',
    'Paneer Dishes',
    'Noodles',
    'Sandwich',
    'Golgappe',
    'South Indian',
    'North Indian'
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final String randomFood = foodItems[Random().nextInt(foodItems.length)];

    return Container(
      height: screenWidth < 600 ? screenHeight * 0.2 : screenHeight * 0.42,
      width: screenWidth * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple.shade300, Colors.blue.shade300],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: EdgeInsets.all(screenWidth < 600 ? 10 : 20),
          child: Stack(
            children: [
              SizedBox(
                height: screenHeight * 0.35,
                width: screenWidth * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Ayeza, You were missed :)",
                      style: TextStyle(
                        fontFamily: 'Funky02',
                        fontSize: kIsWeb
                            ? screenWidth * 0.035
                            : min(screenHeight * 0.03, 28),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Try Mom's magic Recipe  \n of The Day..$randomFood",
                      style: TextStyle(
                        fontFamily: 'Funky02',
                        fontSize: kIsWeb
                            ? screenWidth * 0.03
                            : min(screenHeight * 0.025, 18),
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.95),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Column(
                  children: [
                    Container(
                      width: kIsWeb
                          ? screenWidth * 0.14
                          : min(screenWidth * 0.25, 85),
                      height: kIsWeb
                          ? screenWidth * 0.14
                          : min(screenWidth * 0.2, 80),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://th.bing.com/th/id/OIP.CbCw8lTWveBWSBTTZ8IkEAAAAA?rs=1&pid=ImgDetMain',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ayeza Ansari',
                      style: TextStyle(
                        fontFamily: 'Funky02',
                        fontSize: min(screenWidth * 0.025, 20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
