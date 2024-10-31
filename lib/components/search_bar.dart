import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tasty_reciepes/components/list_builder.dart';
import 'package:tasty_reciepes/controller/api_controller.dart';

class SearchBarTut extends StatefulWidget {
  final TextEditingController searchController;

  const SearchBarTut({
    super.key,
    required this.searchController,
  });

  @override
  State<SearchBarTut> createState() => _SearchBarTutState();
}

class _SearchBarTutState extends State<SearchBarTut> {
  ApiController ac = ApiController();

  @override
  Widget build(BuildContext context) {
    List<String> l1 = [
      'Laddo',
      'Gulabjamun',
      'Ras Malai',
      'Petha',
      'Khoya Barfi'
    ];
    final r = Random();
    String c = l1[r.nextInt(l1.length)];

    // Use MediaQuery to get screen size
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width; // 90% of screen width
    double containerHeight = kIsWeb ? 80 : 70; // Fixed height for uniformity
    double fontSize =
        screenSize.width < 600 ? 16 : 20; // Font size based on width
    double iconSize =
        screenSize.width < 600 ? 24 : 30; // Icon size based on width

    return Container(
      alignment: Alignment.center,
      width: containerWidth,
      height: containerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if ((widget.searchController.text.replaceAll(" ", "") == " ")) {
                debugPrint('blank');
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MakingList(str: widget.searchController.text),
                  ),
                );
              }
            },
            child: Icon(Icons.search, size: iconSize),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.searchController,
              onSubmitted: (value) {
                if (value.replaceAll(" ", "") == "") {
                  debugPrint('blank');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MakingList(str: value),
                    ),
                  );
                }
              },
              style: TextStyle(fontFamily: 'Funky02', fontSize: fontSize),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Recipes... $c',
                hintStyle: TextStyle(fontFamily: 'Funky02', fontSize: fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
