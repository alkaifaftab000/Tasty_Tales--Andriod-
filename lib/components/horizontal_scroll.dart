import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tasty_reciepes/components/list_builder.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> img = [
      {
        'url':
            'https://flaevor.com/wp-content/uploads/2020/09/BaconEggCheeseBurger-1.jpg',
        'label': 'Burger'
      },
      {
        'url':
            'https://www.archanaskitchen.com/images/archanaskitchen/0-Affiliate-Articles/RESTAURANT_STYLE_SOUTH_INDIAN_THALI_original.jpg',
        'label': 'South Indian'
      },
      {
        'url':
            'https://th.bing.com/th/id/R.9ec44ed03d6cea30e7d31c5e5e068a32?rik=%2fNe1JVb8zlW76g&riu=http%3a%2f%2fwww.bravabod.com%2fwp-content%2fuploads%2f2020%2f12%2fSingaporeNoodles_c.jpg&ehk=KT9ePPzFsyDZovRBwEAbrmEhV4qlIR%2balIdesA4CAeY%3d&risl=&pid=ImgRaw&r=0',
        'label': 'Noodles'
      },
      {
        'url':
            'https://th.bing.com/th/id/OIP.ao_xxMmNXqLjYAi1qb8IGwHaDm?rs=1&pid=ImgDetMain',
        'label': 'Manchurian'
      },
      {
        'url':
            'https://www.vegrecipesofindia.com/wp-content/uploads/2018/05/paneer-pizza-recipe27.jpg',
        'label': 'Pizza'
      },
      {
        'url':
            'https://th.bing.com/th/id/OIP.EQdYuknyZocpcFMGH9o0ZAAAAA?rs=1&pid=ImgDetMain',
        'label': 'North Indian'
      },
      {
        'url':
            'https://www.cookingclassy.com/wp-content/uploads/2018/12/roasted-vegetables-10.jpg',
        'label': 'Veg'
      },
      {
        'url':
            'https://www.shutterstock.com/image-photo/chicken-fry-leg-piece-grilled-600w-1720016152.jpg',
        'label': 'Non Veg'
      },
      {
        'url':
            'https://th.bing.com/th/id/R.e16dd46accedec1e3a6ee66222a961d7?rik=NkOJLUPTKlBdiQ&riu=http%3a%2f%2fwww.archanaskitchen.com%2fimages%2farchanaskitchen%2fWorld_Sandwiches_Burgers_Wraps%2fGrilled_Vegetable_Sandwich_with_Herb_Goat_Cheese__Recipe-1.jpg&ehk=NJZkSerSTQS5MSnmYhaNiqsP5AdQsfPun32bnxGZgVk%3d&risl=&pid=ImgRaw&r=0',
        'label': 'SandWich'
      },
      {
        'url': 'https://hamariweb.com/recipes/images/recipeimages/3.jpg',
        'label': 'Biryani'
      },
      {
        'url':
            'https://www.playcast-media.com/wp-content/uploads/2019/12/chicken-1068x1068.jpg',
        'label': 'Chicken'
      },
      {
        'url':
            'https://www.spicyworldofusa.com/wp-content/uploads/2018/09/dish-1-2.jpg',
        'label': 'Panneer'
      },
      {
        'url':
            'https://drop.ndtv.com/albums/COOKS/mutton-recipes-indian/muttongoshtnihari.jpg',
        'label': 'Mutton'
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        const isWeb = kIsWeb;
        final ss = MediaQuery.of(context).size;
        final isSmallScreen = MediaQuery.of(context).size.width < 600;

        double itemWidth = isWeb
            ? (isSmallScreen ? constraints.maxWidth * 0.25 : 190)
            : constraints.maxWidth * 0.25;
        double avatarRadius = isWeb
            ? (isSmallScreen ? itemWidth * 0.35 : itemWidth * 0.35)
            : itemWidth * 0.4;
        double fontSize = isWeb ? (isSmallScreen ? 12 : 15) : 12;

        return Container(
          height: isWeb
              ? isSmallScreen
                  ? ss.height * .23
                  : ss.height * .3
              : ss.height * .16,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: img.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: itemWidth,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(isWeb ? 10 : 5),
                margin: const EdgeInsets.all(isWeb ? 10 : 5),
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MakingList(str: img[index]['label']!),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        elevation: isWeb ? 20 : 10,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          radius: avatarRadius,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: avatarRadius - 2,
                            backgroundImage: NetworkImage(img[index]['url']!),
                          ),
                        ),
                      ),
                      const SizedBox(height: isWeb ? 10 : 5),
                      Text(
                        img[index]['label']!,
                        style: TextStyle(
                          fontFamily: 'Funky02',
                          fontSize: fontSize,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
