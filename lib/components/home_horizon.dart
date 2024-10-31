import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tasty_reciepes/controller/api_controller.dart';

class HomeHorizon extends StatefulWidget {
  const HomeHorizon({super.key});

  @override
  State<HomeHorizon> createState() => _HomeHorizonState();
}

class _HomeHorizonState extends State<HomeHorizon> {
  ApiController ac = ApiController();
  String s = '';
  final List<String> l1 = [
    'Burger', 'Biryani', 'Manchurian', 'French Fries', 'Pizza',
    'Mutton', 'Chicken', 'Panner', 'Noodles', 'Sandwich',
    'Golgappe', 'South Indian', 'North Indian'
  ];
  Random r = Random();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    s = l1[r.nextInt(l1.length)];
    await ac.getRecipes(s);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        // final isVerySmallScreen = constraints.maxWidth < 360;

        return Column(
          children: [
            Container(
              width: isSmallScreen ? 200 : 300,
              height: isSmallScreen ? 80 : 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                textAlign: TextAlign.center,
                s,
                style: TextStyle(
                  fontSize: isSmallScreen ? 30 : 40,
                  fontFamily: 'Funky02',

                ),

              ),
            ),
            SizedBox(height: isSmallScreen ? 10 : 20),
            Container(
              width: constraints.maxWidth,
              height: isSmallScreen ? 300 : 400,

              padding: EdgeInsets.all(isSmallScreen ? 10 : 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(

                itemCount: ac.recipeList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) =>
                    SizedBox(
                  width: isSmallScreen ? 200 : 300,
                  height: isSmallScreen ? 300 : 400,
                  child: InkWell(

                    onTap: () {
                      final appUrl = ac.recipeList[index].appUrl;
                      if (appUrl != null && appUrl.isNotEmpty) {

        EasyLauncher.url(
        url: ac.recipeList[index].appUrl!,
        mode: Mode.platformDefault);
                      }
                    },
                    child: Card(
                      margin: EdgeInsets.all(isSmallScreen ? 5 : 10),
                      elevation: isSmallScreen ? 10 : 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(isSmallScreen ? 15 : 20),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(isSmallScreen ? 15 : 20),

                            child: Image.network(
                              ac.recipeList[index].appImgurl!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 10 : 20,
                                vertical: isSmallScreen ? 3 : 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(isSmallScreen ? 10 : 20),bottomRight: Radius.circular(isSmallScreen ? 10 : 20))
                              ),
                              child: Text(
                                ac.recipeList[index].appLabel ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallScreen ? 16 : 20,
                                  fontFamily: 'Funky02',
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 10 : 20,
                                vertical: isSmallScreen ? 3 : 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(isSmallScreen ? 10 : 20),topRight: Radius.circular(isSmallScreen ? 10 : 20))
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Calories ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isSmallScreen ? 14 : 20,
                                      fontFamily: 'Funky02',
                                    ),
                                  ),
                                  Icon(
                                    Icons.local_fire_department_rounded,
                                    color: Colors.white,
                                    size: isSmallScreen ? 16 : 20,
                                  ),
                                  Text(
                                    (ac.recipeList[index].appCalories.toString()).substring(0, 5),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isSmallScreen ? 14 : 20,
                                      fontFamily: 'Funky02',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
              ),
            ),
          ],
        );
      },
    );
  }
}