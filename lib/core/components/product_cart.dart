
import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/components/cache_image.dart';

import '../../view/auth/ui/widget/custom_elevated_btn.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              const ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: CacheImage(
                    url:
                        "https://img.freepik.com/premium-vector/ramadan-kareem-islamic-post-social-media-background-template_303121-75.jpg?ga=GA1.1.1482810904.1740580934&semt=ais_hybrid",
                  )),
              Positioned(
                  child: Container(
                alignment: Alignment.center,
                width: 65,
                height: 35,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: const Text("10% OFF",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Product Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: AppColors.kGreyColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text("100 LE",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text("120 LE",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.kGreyColor)),
                      ],
                    ),
                    CustomEBtn(
                      text: "Buy Now",
                      onTap: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
