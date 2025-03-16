import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/components/cache_image.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/core/models/product_model/product_model.dart';

import '../../view/auth/ui/widget/custom_elevated_btn.dart';
import '../../view/product_details/ui/product_details_view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product, this.onTap, required this.isFavorite,
  });
  final ProductModel product;
  final Function()? onTap;
  final bool isFavorite ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => naviagteTo(context,  ProductDetailsView(
        product: product,
      )),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    child: CacheImage(
                      url: product.imageUrl ??
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
                  child: Text("${product.sale}% OFF",
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
                      Text(product.productName ?? "Product Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      IconButton(
                        onPressed: onTap,
                        icon:  Icon(
                          Icons.favorite,
                          color: isFavorite ? AppColors.kPrimaryColor : AppColors.kGreyColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("${product.price} LE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Text("${product.oldPrice} LE",
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
      ),
    );
  }
}
