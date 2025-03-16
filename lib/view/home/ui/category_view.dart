import 'package:flutter/material.dart';
import 'package:our_market/core/components/product_list.dart';
import 'package:our_market/core/functions/build_appBar.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, category),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          ProductList(
            category: category,
          ),
        ],
      ),
    );
  }
}
