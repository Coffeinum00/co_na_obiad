import 'dart:math';

import 'package:flutter/material.dart';
import 'package:obiad/logic/random_provider.dart';
import 'package:provider/provider.dart';

class Disc extends StatefulWidget {
  Disc({Key? key}) : super(key: key);

  @override
  State<Disc> createState() => _DiscState();
}

class _DiscState extends State<Disc> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    setRotation(360 * 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.0,
        ),
        Center(
            child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Transform.rotate(
            angle: animation.value,
            child: Image.asset(
              'assets/kolo.png',
              height: 200,
              width: 200,
            ),
          ),
        )),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.teal[300],
          ),
          child: Center(
            child: Text(Provider.of<RandomProvider>(context, listen: true)
                .randomObiad!),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              controller.forward(from: 0);
              Provider.of<RandomProvider>(context, listen: false).randomObiad =
                  Provider.of<RandomProvider>(context, listen: false)
                      .dania![Random().nextInt(
                          Provider.of<RandomProvider>(context, listen: false)
                              .dania!
                              .length)]['name']
                      .toString();
            },
            child: Text('Losuj obiad na dziś!'))
      ],
    );
  }
}
