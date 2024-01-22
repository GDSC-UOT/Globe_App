import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LeaderBoardDisplay extends StatelessWidget {
  // when loading the displays lists from the DB the query fields are going to be user name, current points and rank

  //Current Data is for testing the UI only
  var displays = <UserDisplay>[
    UserDisplay('Judy_MM', 2313, 1),
    UserDisplay('Yaman_A', 2004, 2),
    UserDisplay('Suzyyy', 1982, 3),
    UserDisplay('Dhay_s', 1468, 4),
    UserDisplay('MrH115', 1122, 5),
    UserDisplay('NBA_M', 985, 6),
    UserDisplay('JasemFf', 865, 7),
    UserDisplay('AliAli', 786, 8),
    UserDisplay('Sami', 685, 9),
  ];
  var TopDisplays = <TopUserDisplay>[
    TopUserDisplay(125, 'Jasem_Jmail', 15000, 2),
    TopUserDisplay(150, 'Lily_Hm', 18000, 1),
    TopUserDisplay(100, 'Jodith01', 13000, 3),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i = 0; i < TopDisplays.length; i++) TopDisplays[i],
            ],
          ),
        ),
        // Regular user display
        for (int i = 0; i < displays.length; i++) displays[i],
      ],
    );
  }
}

// A special class to display the top users within the app
class TopUserDisplay extends StatelessWidget {
  double height;
  String userName;
  int userPoints;
  int rank;
  String add = '';

  TopUserDisplay(this.height, this.userName, this.userPoints, this.rank) {
    if (rank == 1)
      add = 'st';
    else if (rank == 2)
      add = 'nd';
    else
      add = 'rd';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('images/Avatar.png'),
            radius: 30,
          ),
          Text(
            userName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            width: 100,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0Xff609966),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: const Color(0Xcd609966),
            ),
            alignment: Alignment.bottomCenter,
            child: Text(
              '$rank$add \n\n$userPoints \n',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// The Main Skeleton for displaying the users in the leader board ranking.
class UserDisplay extends StatelessWidget {
  String userName;
  int userPoints;
  int rank;

  UserDisplay(this.userName, this.userPoints, this.rank) {
    rank += 3;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0XffF4EFEF),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Display user profile
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/Avatar.png'),
                    radius: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  // Display the name and points
                  Text(
                    userName + '\n\n$userPoints',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              // display the Rank
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  '$rank Th',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
