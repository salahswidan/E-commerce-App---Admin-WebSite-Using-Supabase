import 'package:flutter/material.dart';
import '../../../core/components/custom_search_field.dart';
import '../../../core/components/product_list.dart';
import '../../home/ui/widget/categories_list.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          Center(
            child: Text(
              "Welcome To Our Market",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomSearchField(),
          SizedBox(
            height: 15,
          ),
          ProductList()
        ],
      ),
    );
  }
}
