import 'package:flutter/material.dart';
import 'package:language_app/constantsPage.dart';

class CoursePage extends StatelessWidget {
  final String language, progress, level;
  final double progressDecimal;
  final Color color;
  Color? circleColor;
  
  CoursePage(
      {super.key,
      required this.language,
      required this.progress,
      required this.level,
      required this.color,
      required this.circleColor,
      required this.progressDecimal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: color,
        title: const Text(
          'Course',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Colored top background
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
              ),
            ],
          ),

          // Dark circle
          Positioned(
            right: 200,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: circleColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),

          // Grid
          Positioned(
            top: 150,
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const GridPage2(),
            ),
          ),

          //
          Positioned(
            left: 29,
            child: SizedBox(
              height: 275,
              width: 350,
              // color: Colors.blue
              child: Row(
                children: [
                  SizedBox(
                    height: 175,
                    width: 175,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Text(
                            language,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            height: 40,
                            width: 130,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                level,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 175,
                    width: 175,
                    // color: Colors.green,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: PercentIndicatorLarge(
                            progress: progress,
                            progressDecimal: progressDecimal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
