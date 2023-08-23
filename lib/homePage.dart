import 'package:flutter/material.dart';
import 'package:language_app/constantsPage.dart';
import 'package:language_app/coursePage.dart';

import 'package:language_app/courses.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      body: Column(
        children: [

          // For space at top
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
          ),

          // List tile which has photo, name and location.
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/person-1.jpg'),
            ),
            title: Text(
              'Martha Stewart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                Text(
                  'United Kingdom',
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              ],
            ),
          ),

          // 'Welcome back' text.
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 15, 0, 15),
            child: Row(
              children: [
                Text(
                  'Welcome back!',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Box
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage('assets/images/Reading-person-2.jpeg'),),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey,
                  offset: Offset(-1, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            height: 250,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue[100],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Intermediate',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Today\'s',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'challenge',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(18, 0, 0, 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'German meals',
                      style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // "Your Courses" Text
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 20, 0, 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Courses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),

          // Horizontal scroll
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: courses.map(
                (course) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursePage(
                            language: course.language,
                            progress: course.progress,
                            level: course.level,
                            color: course.color,
                            circleColor: course.circleColor,
                            progressDecimal: course.progressDecimal,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: 225,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 7,
                              color: Colors.grey,
                              offset: Offset(-1, 3),
                            ),
                          ],
                          color: course.color,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                child: Text(
                                  course.language,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(21, 10, 10, 10),
                                child: Text(
                                  course.level,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 20, 0),
                                  child: PercentIndicatorSmall(
                                      progress: course.progress,
                                      progressDecimal: course.progressDecimal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
