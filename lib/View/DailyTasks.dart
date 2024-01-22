import 'package:flutter/material.dart';

class DailyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        NewTask('Plant a Flower', 200, 1),
        NewTask('Recycle Plastic', 750, 2),
        NewTask('Get a friend to Join the app', 1000, 3),
        NewTask('Get a friend to Join the app', 1000, 3),
        NewTask('Get a friend to Join the app', 1000, 3),
      ],
    );
  }
}

class NewTask extends StatelessWidget {
  String title;
  int reward;
  int difficulty;
  Color iconColor = Colors.blue;
  String diffText = '';
  var boxes = <BoxDecoration>[
    BoxDecoration(
      color: const Color(0Xbf7F9955),
      border: Border.all(
        color: const Color(0Xff34BD42),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    BoxDecoration(
      color: const Color(0Xbf5F9955),
      border: Border.all(
        color: const Color(0Xff34BD42),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    BoxDecoration(
      color: const Color(0Xbf5F9955),
      border: Border.all(
        color: const Color(0Xff34BD42),
      ),
      image: DecorationImage(
        image: AssetImage(
          'images/Rectangle 11.png',
        ),
        fit: BoxFit.cover,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ];

  NewTask(this.title, this.reward, this.difficulty) {
    if (difficulty == 1) {
      iconColor = Colors.green;
      diffText = 'Easy';
    } else if (difficulty == 2) {
      iconColor = Colors.amber;
      diffText = 'Mid';
    } else if (difficulty == 3) {
      iconColor = Colors.red;
      diffText = 'Hard';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: FractionallySizedBox(
          widthFactor: 0.85,
          child: Container(
            height: 129,
            decoration: boxes[difficulty - 1],
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: const Color(0Xff40513B)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                diffText,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Icon(
                                Icons.circle,
                                color: iconColor,
                                size: 15,
                                fill: 0.75,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 75,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3.5,
                            left: 20,
                          ),
                          child: Text(
                            '+$reward',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
