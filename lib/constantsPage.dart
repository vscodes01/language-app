import 'package:flutter/material.dart';
import 'package:language_app/ThirdPage.dart';
import 'package:language_app/lessonCards.dart';
import 'package:percent_indicator/percent_indicator.dart';


class PercentIndicatorSmall extends StatelessWidget {
  // final Color backgroundColor;
  final String progress;
  final double progressDecimal;

  const PercentIndicatorSmall(
      {super.key, required this.progress, required this.progressDecimal});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 25.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 3.0,
      percent: progressDecimal,
      center: Text(
        "$progress %",
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.white.withOpacity(0.3),
      progressColor: Colors.white,
    );
  }
}

class PercentIndicatorLarge extends StatelessWidget {
  final String progress;
  final double progressDecimal;

  const PercentIndicatorLarge(
      {super.key, required this.progress, required this.progressDecimal});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 40.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 3.0,
      percent: progressDecimal,
      center: Text(
        '$progress%',
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.white.withOpacity(0.3),
      progressColor: Colors.white,
    );
  }
}

class GridPage2 extends StatelessWidget {
  const GridPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
      children: dummyLessonCards
          .map(
            (cardData) => SmallCard(
              description: cardData.description,
              taskCompleted: cardData.taskCompleted,
              icon: cardData.icon,
              iconColor: cardData.iconColor,
              percentCompleted: cardData.percentCompleted,
            ),
          )
          .toList(),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String description, taskCompleted;
  final Icon icon;
  final Color iconColor;
  final double percentCompleted;

  const SmallCard(
      {super.key,
      required this.description,
      required this.taskCompleted,
      required this.icon,
      required this.iconColor,
      required this.percentCompleted});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LessonPage(),
          ),
        );
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 3),
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: icon
                // Icon(
                //   Icons.sticky_note_2_rounded,
                //   color: iconColor,
                //   size: 40,
                // ),
              ),
            ),
            Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  taskCompleted,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '/5',
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: 100.0,
              lineHeight: 8.0,
              percent: percentCompleted,
              progressColor: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
