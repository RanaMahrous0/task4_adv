import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<String> imgList = ['assets/1.jpeg', 'assets/2.jpeg', 'assets/3.jpeg'];
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                CarouselSlider(
                    items: imgList
                        .map((e) => Image.asset(
                              e,
                              fit: BoxFit.cover,
                            ))
                        .toList(),
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        })),
                Positioned(
                    left: 10,
                    child: IconButton(
                        onPressed: () {
                          buttonCarouselController.previousPage();
                        },
                        icon: const Icon(
                          Icons.skip_previous,
                          size: 40,
                        ))),
                Positioned(
                    right: 10,
                    child: IconButton(
                        onPressed: () {
                          buttonCarouselController.nextPage();
                        },
                        icon: const Icon(
                          Icons.skip_next,
                          size: 40,
                        ))),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((e) {
                  return GestureDetector(
                    onTap: () => buttonCarouselController.animateToPage(e.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == e.key
                            ? const Color.fromRGBO(0, 0, 0, 0.9)
                            : const Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
