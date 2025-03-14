import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:our_market/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market/core/functions/build_appBar.dart';
import 'package:our_market/core/functions/navigate_without_back.dart';
import 'package:our_market/core/models/product_model/product_model.dart';
import 'package:our_market/view/auth/ui/widget/custom_text_field.dart';
import 'package:our_market/view/product_details/ui/logic/cubit/product_details_cubit.dart';
import 'package:our_market/view/product_details/ui/widgets/comments_list.dart';

import '../../../core/components/cache_image.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit()..getRates(productId: product.productId!),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) async {
          if (state is AddOrUpdateRateSuccess) {
            naviagteWithoutBack(context, this);
          }
        },
        builder: (context, state) {
          ProductDetailsCubit cubit = context.read<ProductDetailsCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(context, "Product Name"),
            body: state is GetRateLoading 
                ? CustomCircleIndicator()
                : ListView(
                    children: [
                      const CacheImage(
                        url:
                            "https://img.freepik.com/premium-vector/ramadan-kareem-islamic-post-social-media-background-template_303121-75.jpg?ga=GA1.1.1482810904.1740580934&semt=ais_hybrid",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 10),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Product Name"),
                                Text("123 LE"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("${cubit.averageRate} "),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text("Product Description"),
                            const SizedBox(
                              height: 20,
                            ),
                            RatingBar.builder(
                              initialRating: cubit.userRate.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                cubit.addOrUpdateUserRate(
                                    productId: product.productId!,
                                    data: {
                                      "rate": rating.toInt(),
                                      "for_user": cubit.userId,
                                      "for_product": product.productId
                                    });
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              lableText: "Type your feedback",
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.send)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Comments",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const CommentsList()
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
