import 'package:flutter/material.dart';

class ExploreGrid extends StatefulWidget {
  final String imageUrl;

  ExploreGrid({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ExploreGrid> createState() => _ExploreGridState();
}

class _ExploreGridState extends State<ExploreGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imageUrl), fit: BoxFit.fill),
              ),
            ),
          ),
        );
      },
    );
  }
}
