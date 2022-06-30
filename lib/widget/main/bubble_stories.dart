import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class BubbleStories extends StatefulWidget {
  const BubbleStories({Key? key}) : super(key: key);

  @override
  State<BubbleStories> createState() => _BubbleStoriesState();
}

class _BubbleStoriesState extends State<BubbleStories>
    with SingleTickerProviderStateMixin {
  // final String name;
  //
  // BubbleStories({required this.name});

  late Animation<double> gap;
  late Animation<double> base;
  late Animation<double> reverse;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 10.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
              width: 80,
              height: 80,
              child: RotationTransition(
                turns: reverse,
                child: DashedCircle(
                  gapSize: gap.value,
                  dashes: 40,
                  color: Colors.pinkAccent,
                  child: RotationTransition(
                    turns: reverse,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundImage: NetworkImage(
                            'https://wallpaperaccess.com/full/3174207.jpg'),
                      ),
                    ),
                  ),
                ),
              )
              // Container(
              //   width: 70,
              //   height: 70,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.grey[400],
              //       image: DecorationImage(
              //         image: AssetImage("asset/1.jpeg"),
              //       )),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Text(name,
              //     style: TextStyle(
              //         fontSize: 16, color: Colors.black87, fontFamily: 'BNazanin')),
              ),
        ],
      ),
    );
  }
}
