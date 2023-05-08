import 'package:flutter/material.dart';
import 'package:web1_app/constants/colors.dart';
import 'package:web1_app/service/post_service.dart';
import 'package:web1_app/widgets/custom_input_clean.dart';

import '../models/post.dart';
import 'home.dart';

class CreatePost extends StatefulWidget {

  Function funcRefresh;

  CreatePost({ Key? key, required this.funcRefresh }) : super(key: key);
  // const CreatePost({ Key? key }) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final PostService _postService = PostService();

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];


  @override
  void initState() {
    super.initState();

    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _titleControll = TextEditingController();
  final _textControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
  final mediaQuery = MediaQuery.of(context);

  final width = mediaQuery.size.height;
  final height = mediaQuery.size.width;

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 60
            ),
            width: width,
            color: background,
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  const Text(
                    "Create post",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ), 

                  const SizedBox(height: 40),
                  CustomInputClean(
                    placeholder: "Informe o título", 
                    controller: _titleControll
                  ),

                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 150),
                    child: CustomInputClean(
                      placeholder: "Escreva algo", 
                      controller: _textControll
                    ),
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: titleText,
                      shadowColor: const Color(0xFF963AFF),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      minimumSize: const Size(500, 60), 
                    ),
                    onPressed: () async {
                        
                      Post post = await  _postService.create(
                        title: _titleControll.text,
                        text: _textControll.text
                      );

                      // remove unnecessary check null
                      if (post != null) {

                        widget.funcRefresh();

                        if(!mounted) return;
                        Navigator.pop(context);

                      } else {
                        // implement custom snack bar...
                        showSnackBar("create error");
                      }
                      
                    },
                    child: const Text(
                      'Criar',
                      style:  TextStyle(
                        fontSize: 18,
                        color: textInput,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          color: titleText,
                          size: 12,
                        ),

                        SizedBox(width: 5),

                        Text(
                          'Voltar',
                          style: TextStyle(
                            color: titleText,
                            fontSize: 12
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

}