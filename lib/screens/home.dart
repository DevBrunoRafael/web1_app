import 'package:flutter/material.dart';
import 'package:web1_app/screens/create_post.dart';
import 'package:web1_app/service/post_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:web1_app/widgets/search_box.dart';
import '../models/post.dart';
import '../constants/colors.dart';
import '../widgets/post_card.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PostService _service = PostService();

  List<Post> _postList = [];

  List<Post> _postListDisplay = [];

  @override
  void initState() {
    super.initState();

    _onRefresh();
  }

  Future<void> _onRefresh() {
    _updatePostList();
    return Future.delayed(const Duration(seconds: 1));
  }

  void _updatePostList() {
    _service.listAll().then((value) {
      setState(() {
        _postList = value;
        _postListDisplay = _postList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,

        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      background,
                      background.withOpacity(0.1),
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 20
                ),
                child: SearchBox(
                  funcSearch: _onSearch,
                  funcRefresh: _updatePostList,
                ),
              ),

              Expanded(
                child: LiquidPullToRefresh(
                  backgroundColor: titleText,
                  borderWidth: 3,
                  color: background,
                  showChildOpacityTransition: true,
                  springAnimationDurationInMilliseconds: 400,
                  animSpeedFactor: 1,
                  height: 100,

                  onRefresh: _onRefresh,
                  child: ListView(

                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 30,
                          bottom: 20,
                        ),
                        child: const Text(
                          'Posts',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        ),
                      ),
                      for (Post post in _postListDisplay.reversed)
                        PostCard(
                          post: post,
                          funcRefresh: _updatePostList,
                        ),

                      const SizedBox(height: 20)
                    ],
                  ), 
                )
              )
            ],
          ),
        ),
      ), 
    );
  }

  void _onSearch(String value) {
    List<Post> results = [];

    if (value.isEmpty) {
      results = _postList;
    } else {

      results = _postList.where((item) => item.title!
        .toLowerCase()
        .contains(value.toLowerCase()))
        .toList();

    }

    setState(() {
      _postListDisplay = results;
    });
  }

}
