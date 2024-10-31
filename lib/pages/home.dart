import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tasty_reciepes/components/home_horizon.dart';
import 'package:tasty_reciepes/components/home_text.dart';
import 'package:tasty_reciepes/components/horizontal_scroll.dart';
import 'package:tasty_reciepes/components/search_bar.dart';
import 'package:tasty_reciepes/controller/api_controller.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  ApiController ac = ApiController();

  void updateHomeScreen() {
    fetchData();
  }

  void fetchData() async {
    String query = searchController.text;
    ac.clearRecipeList();
    await ac.getRecipes(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20),
                child: Column(
                  children: [
                    HomeText(),
                    const SizedBox(height: 20),
                    SearchBarTut(searchController: searchController),
                    const SizedBox(height: 20),
                    ScrollConfiguration(
                      behavior: MyCustomScrollBehavior(),
                      child: const Categories(),
                    ),
                    const SizedBox(height: 20),
                    _buildTitleContainer(isDesktop),
                    // const SizedBox(height: 20),
                    _buildHomeHorizonList(isDesktop),
                    _buildFooter(isDesktop),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleContainer(bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Most Loved Recipes',
        style: TextStyle(
          fontFamily: 'Funky02',
          fontSize: isDesktop ? 50 : 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHomeHorizonList(bool isDesktop) {
    return Column(
      children: List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: isDesktop ? 20 : 10),
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: const HomeHorizon(),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(bool isDesktop) {
    return Container(
      width: isDesktop ? 800 : double.infinity,
      height: isDesktop ? 60 : 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isDesktop ? 20 : 10),
          topRight: Radius.circular(isDesktop ? 20 : 10),
        ),
      ),
      child: Text(
        'Designed By Alkaif',
        style: TextStyle(
          fontFamily: 'Funky02',
          fontSize: isDesktop ? 24 : 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
