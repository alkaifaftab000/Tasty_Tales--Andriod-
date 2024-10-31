import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:tasty_reciepes/controller/api_controller.dart';

class MakingList extends StatefulWidget {
  final String str;

  const MakingList({super.key, required this.str});

  @override
  State<MakingList> createState() => _MakingListState();
}

class _MakingListState extends State<MakingList> {
  ApiController ac = ApiController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    String query = widget.str;
    ac.clearRecipeList();
    await ac.getRecipes(query);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        final isVerySmallScreen = constraints.maxWidth < 360;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Search Results: ${widget.str}",
              style: TextStyle(
                fontSize: isSmallScreen ? (isVerySmallScreen ? 14 : 16) : 22,
                fontFamily: 'Funky02',
              ),
            ),
          ),
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(isSmallScreen ? 8 : 20),
            padding: EdgeInsets.all(isSmallScreen ? 8 : 20),
            color: Colors.white,
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: ac.recipeList.isEmpty
                ? const Center(child: Text("No results found"))
                : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isSmallScreen ? 1 : (constraints.maxWidth > 840 ? 3 : 2),
                childAspectRatio: isSmallScreen ? (isVerySmallScreen ? 1.2 : 1.5) : 1.2,
                mainAxisSpacing: isSmallScreen ? 10 : 20,
                crossAxisSpacing: isSmallScreen ? 10 : 20,
              ),
              itemCount: ac.recipeList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    EasyLauncher.url(
                      url: ac.recipeList[index].appUrl!,
                      mode: Mode.platformDefault,
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: isSmallScreen ? 8 : 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isSmallScreen ? 10 : 20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(isSmallScreen ? 10 : 20),
                            ),
                            child: Image.network(
                              ac.recipeList[index].appImgurl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 8 : 20,
                            vertical: isSmallScreen ? 3 : 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(isSmallScreen ? 10 : 20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ac.recipeList[index].appLabel ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallScreen
                                      ? (isVerySmallScreen ? 12 : 14)
                                      : 20,
                                  fontFamily: 'Funky02',
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 2 : 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Calories ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isSmallScreen
                                          ? (isVerySmallScreen ? 10 : 12)
                                          : 18,
                                      fontFamily: 'Funky02',
                                    ),
                                  ),
                                  Icon(
                                    Icons.local_fire_department_rounded,
                                    color: Colors.red,
                                    size: isSmallScreen
                                        ? (isVerySmallScreen ? 12 : 14)
                                        : 22,
                                  ),
                                  Text(
                                    (ac.recipeList[index].appCalories.toString()).substring(0, 5),
                                    style: TextStyle(
                                      fontFamily: 'Funky02',
                                      color: Colors.white,
                                      fontSize: isSmallScreen
                                          ? (isVerySmallScreen ? 10 : 12)
                                          : 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}