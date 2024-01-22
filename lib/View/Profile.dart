import 'package:flutter/material.dart';
import 'package:globe/View/Community.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileDisplay(),
        AchievementDisplay(),
        PostDisplay('Name', 'Oh no', 'Its a ME'),
        PostDisplay('Name', 'Oh Yes', 'Bruh'),
      ],
    );
  }
}

// A class to display the main part of the profile only AKA the photo, name and user name
class ProfileDisplay extends StatelessWidget {
  String realName = 'Vaas Montenegro';
  String userName = 'DefinitionOfInsanity';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('images/Vas.png'),
              radius: 70,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: const Color(0Xbf7F9955),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                realName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '@$userName',
              style: const TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AchievementDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                child: const Text(
                  'Achievements',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AchievementBracket(),
                AchievementBracket(),
                AchievementBracket(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementBracket extends StatelessWidget {
  const AchievementBracket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0XffE7E7E7),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(
                'images/tree.png',
              ),
              fit: BoxFit.scaleDown,
              height: 80,
            ),
            Text(
              'Title',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
