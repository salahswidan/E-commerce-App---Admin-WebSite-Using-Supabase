import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/components/custom_search_field.dart';
import 'widget/categories_list.dart';

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
          CategoriesList()
        ],
      ),
    );
  }
}
