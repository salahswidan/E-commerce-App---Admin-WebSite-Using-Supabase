import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:our_market/core/functions/build_appBar.dart';
import 'package:our_market/view/auth/ui/widget/custom_text_field.dart';
import 'package:our_market/view/product_details/ui/widgets/comments_list.dart';

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
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Name"),
                    Text("123 LE"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("3 "),
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
                SizedBox(
                  height: 30,
                ),
                Text("Product Description"),
                SizedBox(
                  height: 20,
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  lableText: "Type your feedback",
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Comments",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CommentsList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
