import 'package:flutter/material.dart';
import 'package:globe/View/Achievements.dart';
import 'package:globe/View/Community.dart';
import 'package:globe/View/DailyTasks.dart';
import 'package:globe/View/LeaderBoard.dart';
import 'package:globe/View/PointShop.dart';
import 'package:globe/View/Profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var pages = <Widget>[
    DailyTasks(),
    ShopWindow(),
    Profile(),
    AchievementsTree(),
    CommunityBlog(),
    LeaderBoardDisplay(),
  ];
  var pageNames = <String>[
    'Daily Tasks',
    'Point Shop',
    'Profile',
    'Achievement',
    'Community blog',
    'Leaderboard',
  ];
  int _pageIndex = 4;
  void draw() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: ImageIcon(
              AssetImage('images/Group 4.png'),
              color: Color(0Xff609966),
              size: 45,
            ),
          ),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: ElevatedButton(
                onPressed: draw,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Color(0Xff40513B),
                ),
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              pageNames.elementAt(_pageIndex),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                )),
            pages.elementAt(_pageIndex),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 25, right: 25),
              child: Align(
                alignment: const Alignment(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: BottomNavigationBar(
                    selectedItemColor: const Color(0xffEDF1D6),
                    unselectedItemColor: const Color(0xbfEDF1D6),
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    backgroundColor: const Color(0Xff40513B),
                    elevation: 0,
                    enableFeedback: true,
                    currentIndex: _pageIndex,
                    onTap: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.check_box_outlined),
                        label: 'Daily Tasks',
                        backgroundColor: Color(0Xff40513B),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.store_rounded),
                        label: 'Point Shot',
                        backgroundColor: Color(0Xff40513B),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                        backgroundColor: Color(0Xff40513B),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.wine_bar),
                        label: 'Achievement',
                        backgroundColor: Color(0Xff40513B),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.people_alt),
                        label: 'Community Blog',
                        backgroundColor: Color(0Xff40513B),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.stacked_bar_chart_outlined),
                        label: 'Leaderboard',
                        backgroundColor: Color(0Xff40513B),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
