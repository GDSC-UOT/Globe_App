import 'dart:math';

import 'package:flutter/material.dart';

class CommunityBlog extends StatelessWidget {
  var posts = <PostDisplay>[
    for (int i = 0; i < 10; i++)
      PostDisplay(
        'I have an Exam',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
        'Yaman_E',
      ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 25,
        ),
        for (int i = 0; i < posts.length; i++) posts[i],
      ],
    );
  }
}

// Display for the main part of the community post where all posts are lined up to be viewed
class PostDisplay extends StatelessWidget {
  String postName;
  String postBody;
  String userName;
  int reactions = 0;
  var time = DateTime.now();
  // Constructor
  PostDisplay(this.postName, this.postBody, this.userName);
  void Disp() {}
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0XffF4EFEF),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 8),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('images/Avatar.png'),
                          radius: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '$userName\n$time',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: Disp,
                    child: Icon(Icons.more_vert),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(15, 15),
                      shape: const CircleBorder(
                        eccentricity: 0.1,
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      foregroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 5,
                      ),
                      child: Text(
                        postName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 20,
                        right: 10,
                      ),
                      child: Text(
                        postBody,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
              reactionCounter(reactions),
            ],
          ),
        ),
      ),
    );
  }
}

class reactionCounter extends StatelessWidget {
  int reactions;
  Random rnd = Random();
  reactionCounter(this.reactions) {
    reactions = rnd.nextInt(120);
  }
  void React() {}
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Wrap(
            spacing: -18,
            children: [
              for (int i = 0; i < 6; i++)
                const CircleAvatar(
                  backgroundImage: AssetImage('images/Avatar.png'),
                  radius: 15,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 8),
                child: Text(
                  '$reactions Reactions',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Reaction Buttons

        ElevatedButton(
          onPressed: React,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black12,
            fixedSize: const Size(15, 15),
            shape: const CircleBorder(
              eccentricity: 0,
            ),
          ),
          child: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
