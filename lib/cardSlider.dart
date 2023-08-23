import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  late final PageController pageController;
  int pageNo = 0;

  List<String> sentences = [
    'Bonjour, je m\'appelle Jessica. Je suis un ingénieur logiciel.',
    'Je suis un ingénieur logiciel. Je vis à Delhi et travaille à Noida.',
    'Il va certainement pleuvoir aujourd\'hui!',
    'Mon plat préféré est la pizza. Mais n\'aime pas le burger.',
    'Avez-vous déjà visité l\'Europe?',
  ];

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,

      // For seeing small part of left and right card.
      // viewportFraction: 0.85,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow:  [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 3),
                color: Colors.grey,
              ),
            ],
          ),
          // color: Colors.green,
          height: 250,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (ctx, child) {
                  return child;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.pause,
                              color: Colors.black,
                            ),
                            Spacer(),
                            Icon(
                              Icons.chat_rounded,
                              color: Colors.blue,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 175,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            sentences[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          Icon(
                            Icons.pause,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
        const SizedBox(
          height: 12,
        ),

        // Indicators(small dots).
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Container(
              margin: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.circle,
                size: 12.0,
                color: pageNo == index ? Colors.indigoAccent : Colors.grey[300],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

