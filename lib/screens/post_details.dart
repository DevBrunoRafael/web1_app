import 'package:flutter/material.dart';
import 'package:web1_app/constants/colors.dart';
import 'package:web1_app/service/post_service.dart';

import '../models/post.dart';
import '../widgets/edit_post_modal.dart';

class PostDetails extends StatefulWidget {

  Post post;
  Function funcRefresh;

  PostDetails({ Key? key, required this.post, required this.funcRefresh }) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {

  final PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Expanded(
                    child: Text(
                      widget.post.title!,
                      maxLines: null,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),

                  const SizedBox(width: 30),
                  PopupMenuButton(
                    color: cardLogin,
                    iconSize: 35,
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                    onSelected: (value) async {

                      if (value == "edit") {

                        showDialog(
                          context: context,

                          builder: (context) => EditPostModal(
                            post: widget.post,
                            funcUpdate: _onUpdate,
                            funcRefresh: widget.funcRefresh,
                          ),
                        );

                      } else if (value == "delete") {

                        bool success = await _postService.delete(widget.post.id!);

                        if (success) {
                          widget.funcRefresh();

                          if(!mounted) return;
                          Navigator.pop(context);
                        }
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: "edit",
                          child: Text(
                            "Editar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const PopupMenuItem(
                          value: "delete",
                          child: Text(
                            "Excluir",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ];
                    }
                  ),

                ],
              ),

              const SizedBox(height: 30),
              Text(
                widget.post.text!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 30),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  // ação ao pressionar o botão "Voltar ao login"
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      color: titleText,
                      size: 16,
                    ),

                    SizedBox(width: 5),

                    Text(
                      'Voltar',
                      style: TextStyle(
                        color: titleText,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          
        ),
      ),
    );
  }

  void _onUpdate(int id, String newTitle, String newText) async {

    Post post = await _postService.update(
      id,
      title: newTitle,
      text: newText
    );

    setState(() {
      widget.post = post;
    });
  }

}