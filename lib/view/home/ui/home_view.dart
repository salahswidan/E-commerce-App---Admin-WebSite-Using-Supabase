import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/components/custom_search_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchField(),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/buy.jpg"),
          SizedBox(
            height: 15,
          ),
          Text(
            "Popular Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kWhiteColor,
                        child: Icon(
                          categories[index].icon,
                          size: 40,
                        ),
                      ),
                      Text(categories[index].text),
                    ],
                  ),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}

List<Category> categories = [
  Category(
    text: "Sports",
    icon: Icons.sports,
  ),
  Category(
    text: "Electronics",
    icon: Icons.tv,
  ),
  Category(text: "Collections", icon: Icons.collections),
  Category(
    text: "Books",
    icon: Icons.book,
  ),
  Category(
    text: "Games",
    icon: Icons.games,
  ),
  Category(
    text: "Bikes",
    icon: Icons.bike_scooter,
  ),
];

class Category {
  final String text;
  final IconData icon;

  Category({required this.text, required this.icon});
}
