import 'package:flutter/material.dart';

class CarouselMistbox extends StatelessWidget {

  final String carouselimage;
  final String carouseltext;

   CarouselMistbox({
    required this.carouselimage,
    required this.carouseltext

   });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 138,
            width: 201,
            child: Image.asset('assets/common/mistbox1.png')),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 38,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xffFFC46D),
                    Color(0xffFFD067),
                    Color(0xffCD553F),
                  ])),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffFFF500)),
              child: const Center(
                child: Text(
                  'Draw!',
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(offset: Offset(2, 1), color: Color(0xffF9E9C9))
                    ],
                    color: Color(0xff94512A),
                    fontSize: 20,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 50,
                width: 50,
                child: Image.asset(carouselimage)),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'x',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
             Text(carouseltext,
                style: const TextStyle(fontSize: 24, color: Colors.white))
          ],
        )
      ],
    );
  }
}

class CarouselMistbox1 extends StatelessWidget {

  final String carouselimage;
  final String carouseltext;

   CarouselMistbox1({
    required this.carouselimage,
    required this.carouseltext

   });

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
            height: 138,
            width: 201,
            child: Image.asset('assets/common/mistbox.png')),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 38,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xffFFC46D),
                    Color(0xffFFD067),
                    Color(0xffCD553F),
                  ])),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffFFF500)),
              child: const Center(
                child: Text(
                  'Draw!',
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(offset: Offset(2, 1), color: Color(0xffF9E9C9))
                    ],
                    color: Color(0xff94512A),
                    fontSize: 20,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 50,
                width: 50,
                child: Image.asset(carouselimage)),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'x',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
             Text(carouseltext,
                style: const TextStyle(fontSize: 24, color: Colors.white))
          ],
        )
      ],
    );
  }
}


