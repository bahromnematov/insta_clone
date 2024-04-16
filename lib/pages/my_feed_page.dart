import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../servise/db_service.dart';

class MyFeedPage extends StatefulWidget {
  final PageController? pageController;

  MyFeedPage({super.key, this.pageController});

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  bool isLoading = false;
  List<Post> items = [];

  _apiLoadFeeds() {
    setState(() {
      isLoading = true;
    });
    DBService.loadFeeds().then((value) => {
          _resLoadFeeds(value),
        });
  }

  _resLoadFeeds(List<Post> posts) {
    setState(() {
      items = posts;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiLoadFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Instagram",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontFamily: "Billabong"),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  widget.pageController!.animateToPage(2,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: Color.fromRGBO(193, 53, 132, 1),
                ))
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _itemOfPost(items[index]);
              },
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox()
          ],
        ));
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: post.img_user.isEmpty
                              ? Image(
                                  image:
                                      AssetImage("assets/images/ic_person.png"),
                                  width: 40,
                                  height: 40,
                                )
                              : Image.network(
                                  post.img_user,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.fullname,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            post.date,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                ],
              )),
          SizedBox(
            height: 8,
          ),
          CachedNetworkImage(
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
            imageUrl: post.img_post,
            placeholder: (context, url) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          ),

          //like and share
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        EvaIcons.heartOutline,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mode_comment_outlined,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        EvaIcons.shareOutline,
                        color: Colors.red,
                      )),
                ],
              ),
            ],
          ),

          //caption

          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                  text: "${post.caption}",
                  style: TextStyle(color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}
