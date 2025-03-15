import 'package:flutter/material.dart';
import 'package:our_market/core/components/product_list.dart';
import 'package:our_market/core/functions/build_appBar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Search  Results"),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          ProductList(query:query ,),
        ],
      ),
    );
  }
}
