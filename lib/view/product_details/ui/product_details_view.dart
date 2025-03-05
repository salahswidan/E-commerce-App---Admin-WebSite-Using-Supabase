import 'package:flutter/material.dart';
import 'package:our_market/core/functions/build_appBar.dart';

import '../../../core/components/cache_image.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Product Name"),
      body: ListView(
        children: [
          CacheImage(
            url:
                "https://img.freepik.com/premium-vector/ramadan-kareem-islamic-post-social-media-background-template_303121-75.jpg?ga=GA1.1.1482810904.1740580934&semt=ais_hybrid",
          )
        ],
      ),
    );
  }
}
