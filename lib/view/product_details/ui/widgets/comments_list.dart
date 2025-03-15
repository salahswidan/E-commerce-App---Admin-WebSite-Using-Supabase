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
            return Center(
              child: CustomCircleIndicator(),
            );  
            
          }else if(snapshot.hasData){
           return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => UserComment(),
                separatorBuilder: (context, index) => Divider(),
                itemCount: 10);
          }else if(!snapshot.hasData){
            return Center(
              child: Text("No Comments yet"),
            );
          }else{
            return Center(
              child: Text("Something went Error, Please try again later"),
            );
          }
          });
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("User Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ],
        ),
        Row(
          children: [
            Text("Comment"),
          ],
        ),
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
            Text("Replay......"),
          ],
        ),
      ],
    );
  }
}
