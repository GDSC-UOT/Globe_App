import 'dart:math';

import 'package:flutter/material.dart';

class ShopWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, bottom: 5),
        child: Wrap(
          children: const [
            Text(
              'weekly specials',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff40513B),
                fontWeight: FontWeight.w500,
              ),
            ),
            ImageIcon(
              const AssetImage('images/Star Fall.png'),
              color: Color(0xff40513B),
            ),
          ],
        ),
      ),
      ShopItem("gift card 10", " 1K", "images/SteamCard.png"),
      Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 30),
        child: Wrap(
          children: [
            Text(
              'daily offers ',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff40513B),
                fontWeight: FontWeight.w500,
              ),
            ),
            ImageIcon(
              const AssetImage('images/Earth.png'),
              color: Color(0xff40513B),
            ),
          ],
        ),
      ),
      ShopItem("super awesome \nscooter", " 5K", "images/Kick scooter.png"),
      ShopItem("bicycle", " 2K", "images/Bike.png"),
      ShopItem("Donate to \nCharity", "5K", "images/Charity.png"),
      Padding(
        padding: EdgeInsets.all(100),
      )
    ]);
  }
}

class ShopItem extends StatelessWidget {
  String itemName = "Steam Card";
  String ItemPrice = "5K";
  String ItemPhoto = "images/SteamCard.png";
  int colorIndex = 0;
  var mainColors = const <Color>[
    Color(0Xff8FB888),
    Color(0XffF6F8EB),
  ];
  var accentColor = const <Color>[
    Color(0Xff80A579),
    Color(0XffD7D9CA),
  ];
  var textColors = const <Color>[
    Colors.white,
    Color(0Xff40513B),
  ];
  var pointColor = const <Color>[
    Color(0xffD3EED6),
    Color(0xff609966),
  ];

  ShopItem(this.itemName, this.ItemPrice, this.ItemPhoto) {
    var rnd = Random();
    colorIndex = rnd.nextInt(2);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Container(
                height: 135,
                decoration: BoxDecoration(
                  color: mainColors[colorIndex],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemName,
                          style: TextStyle(
                            fontSize: 18,
                            color: textColors[colorIndex],
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              const AssetImage('images/PointIcon.png'),
                              color: pointColor[colorIndex],
                            ),
                            Text(
                              ItemPrice,
                              style: TextStyle(
                                fontSize: 18,
                                color: pointColor[colorIndex],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      ItemPhoto,
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: NativeClipper(),
                child: Container(
                  height: 135,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: accentColor[colorIndex],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemName,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              ImageIcon(
                                const AssetImage('images/PointIcon.png'),
                                color: pointColor[colorIndex],
                              ),
                              Text(
                                ItemPrice,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0XffD3EED6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        ItemPhoto,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 5, size.height, size.width, size.height);
    path.lineTo(size.width / 3, size.height + 50);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
