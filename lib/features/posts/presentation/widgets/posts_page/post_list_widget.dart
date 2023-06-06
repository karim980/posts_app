import '../../pages/post_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            padding: EdgeInsets.only(top: 25,right: 20,left: 20,bottom: 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                posts[index].title,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 14,
              ),
              Text(posts[index].body),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image(
                    image: AssetImage('assets/pexels-margerretta-548084.jpg')),
              )
            ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PostDetailPage(post: posts[index]),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 1),
    );
  }
}
