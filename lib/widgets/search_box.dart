import 'package:flutter/material.dart';
import 'package:web1_app/screens/login.dart';

import '../constants/colors.dart';
import '../models/post.dart';
import '../screens/create_post.dart';

class SearchBox extends StatefulWidget {

  final funcSearch;
  final funcRefresh;

  SearchBox({ Key? key, this.funcSearch, this.funcRefresh }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ 
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15
            ),
            decoration: BoxDecoration(
              color: cardLogin,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(

              onChanged: (value) => widget.funcSearch(value),

              cursorColor: textInput,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: textInput,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                suffixIcon: Icon(
                  Icons.search,
                  color: placeholderInput,
                  size: 25,
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 20,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: placeholderInput,
                  fontSize: 18
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Container(
          height: 47,
          width: 47,
          decoration: BoxDecoration(
            color: titleText,
            borderRadius: BorderRadius.circular(4),
          ),

          child: PopupMenuButton(
            color: titleText,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
                  .copyWith(topRight: const Radius.circular(4))
            ),
            iconSize: 35,
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            ),

            onSelected: (value) {
              if (value == "new post") {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (_) => CreatePost(
                    funcRefresh: widget.funcRefresh,
                  ))
                );
              } else if (value == "quit") {
                Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (_) => const Login()),
                );
              }
            },

            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "new post",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 7),
                          Text(
                            'New post',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      const Divider()
                    ],
                  )
                ),
                PopupMenuItem(
                  value: "quit",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.logout_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Quit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      const Divider()
                    ],
                  ),

                ),
              ];
            }
          ),
        ),
        
      ]
    );
  }
}