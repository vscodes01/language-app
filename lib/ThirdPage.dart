import 'package:flutter/material.dart';
import 'package:language_app/cardSlider.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 245, 245),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Lesson',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // pink bg
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.pink,
            ),

            // Blue container on top.
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),

            // Dark circle
            Positioned(
              right: 200,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
            ),

            // White text on blue container.
            Positioned(
              child: Container(
                width: 400,
                height: 175,
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                          child: Text(
                            'Translate these',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Text(
                            'phrases to english',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Sliding Card Container
            Positioned(
              top: 150,
              bottom: 300,
              right: 25,
              left: 25,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                // color: Colors.green,
                child: const CardSlider(),
              ),
            ),

            const Positioned(
              top: 450,
              right: 55,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  height: 375,
                  width: 300,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                        ),
                      ),
                      hintText: 'Your ans...',
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 175,
              left: 177,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.check,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
