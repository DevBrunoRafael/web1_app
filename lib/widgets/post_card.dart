import 'package:flutter/material.dart';
import 'package:web1_app/screens/post_details.dart';

import '../models/post.dart';
import '../constants/colors.dart';

class PostCard extends StatelessWidget {
  final Post post;
  Function funcRefresh;

  PostCard({ Key? key, required this.post, required this.funcRefresh }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          // implements
        },

        tileColor: cardLogin,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),

        title: Text(
          post.title!,
          style: const TextStyle(
            fontSize: 18,
            color: textInput,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '${post.author}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${post.createdAt}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),

        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 40,
          width: 38,
          decoration: BoxDecoration(
            color: titleText,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              // print('Clicked on delete icon');

              Navigator.push(context,
                MaterialPageRoute(builder: (context) => PostDetails(
                  post: post,
                  funcRefresh: funcRefresh,
                ))
              );
            },
          ),
        ),
      ),
    );
  }
}
