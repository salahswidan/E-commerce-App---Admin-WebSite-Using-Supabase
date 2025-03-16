import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/functions/navigate_to.dart';
import '../category_view.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()=> naviagteTo(context, CategoryView(category: categories[index].text,)),
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
            ),
          );
        },
        itemCount: categories.length,
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
