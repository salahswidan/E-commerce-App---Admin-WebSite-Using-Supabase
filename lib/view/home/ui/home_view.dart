import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:our_market/view/auth/ui/widget/custom_elevated_btn.dart';
import '../../../core/app_colors.dart';
import '../../../core/components/cache_image.dart';
import '../../../core/components/custom_search_field.dart';
import '../../../core/components/product_list.dart';
import 'widget/categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const CustomSearchField(),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/buy.jpg"),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Popular Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const CategoriesList(),
          const SizedBox(
            height: 15,
          ),
          Text("Recommended Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          const SizedBox(
            height: 15,
          ),
          ProductList()
        ],
      ),
    );
  }
}
