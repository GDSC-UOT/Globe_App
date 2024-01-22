import 'package:flutter/material.dart';

class AchievementsTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ViewAchievements(),
          const SizedBox(height: 250),
          Stack(
            alignment: const Alignment(0, 1),
            fit: StackFit.loose,
            children: const [
              Image(
                image: AssetImage('images/Soil.png'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 160, right: 35),
                child: Image(
                  image: AssetImage('images/sprout.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// A button that is pressed to show a list of available achievements.
class ViewAchievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color(0Xbf659955),
          border: Border.all(
            color: const Color(0Xff34BD42),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'grow your tree from a small sprout by collecting more points',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                '*click here to know more !',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffEDF1D6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
