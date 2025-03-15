import 'package:flutter/material.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/view/home/ui/search_view.dart';
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
          CustomSearchField(
            // controller: TextEditingController(),
            onPressed: () => naviagteTo(context, SearchView()),
          ),
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
          const Text("Recommended Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          const SizedBox(
            height: 15,
          ),
          const ProductList()
        ],
      ),
    );
  }
}
