import 'package:flutter/material.dart';
import '../../../core/components/product_list.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          Center(
            child: Text(
              "Your Favorite Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ProductList(
            isFavoriteView: true,
          )
        ],
      ),
    );
  }
}
