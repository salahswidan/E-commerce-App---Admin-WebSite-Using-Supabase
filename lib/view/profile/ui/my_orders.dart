import 'package:flutter/material.dart';
import 'package:our_market/core/components/product_list.dart';
import 'package:our_market/core/functions/build_appBar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "My Orders"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductList(
          shrinkWrap: false,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
