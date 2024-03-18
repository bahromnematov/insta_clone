import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class MyFeedPage extends StatefulWidget {
  const MyFeedPage({super.key});

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  bool isLoading = false;
  List<Post> items = [];

  String img1 =
      'https://images.unsplash.com/photo-1708545158412-ae3d000a2edf?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String img2 =
      "https://plus.unsplash.com/premium_photo-1709311451252-fbe6d75e3cc5?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  String img3 =
      "https://plus.unsplash.com/premium_photo-1709311451252-fbe6d75e3cc5?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Post(img1, "Bu bizning 1 chi postdagi izohimiz"));
    items.add(Post(img2, "Bu bizning 2 chi postdagi izohimiz"));
    items.add(Post(img3, "Bu bizning 3 chi postdagi izohimiz"));
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
                onPressed: () {},
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
                        child: Image(
                          image: AssetImage("assets/images/ic_person.png"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nematov Bahrom",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "2024-03-18 1:23",
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
                        EvaIcons.heart,
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
