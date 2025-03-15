import 'package:flutter/material.dart';
import 'package:our_market/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market/core/models/product_model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client
            .from("comments_table")
            .stream(primaryKey: ["id"])
            .eq("for_product", productModel.productId!)
            .order("created_at"),
        builder: (_, snapshot) {
          List<Map<String, dynamic>>? data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CustomCircleIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>  UserComment(
                commentData: data?
                [index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: data?.length ?? 0,
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("No Comments yet"),
            );
          } else {
            return const Center(
              child: Text("Something went Error, Please try again later"),
            );
          }
        });
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    super.key, required this.commentData,
  });
final  Map<String, dynamic>? commentData;
//  {
//         "id": "cd88cd2d-2390-4c2c-80f6-18a623ae0411",
//         "created_at": "2025-03-11T19:21:48.405803+00:00",
//         "comment": "good product",
//         "for_user": "a3044c2f-66b8-4b8b-b082-ea2e38b993d5",
//         "for_product": "ba8d9e6c-8365-496e-be8c-030526544163",
//         "user_name": null,
//         "replay": null
//     },
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Text(
              commentData?["user_name"] ?? "User Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ],
        ),
        Row(
          children: [
            Text(
                commentData?["comment"] ?? "Comment"),
          ],
        ),
       commentData?["replay"] != null ? 
        Column(
          children: [
            Row(
              children: [
                Text("Replay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ],
            ),
                Row(
          children: [
            Text(
               commentData!["replay"])
              ,
          ],
        ),
          ],
        )
    
        :  Container()],
    );
  }
}
