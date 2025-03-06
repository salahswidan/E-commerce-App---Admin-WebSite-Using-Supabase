
import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => UserComment(),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10);
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
