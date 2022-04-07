import 'package:flutter/material.dart';

class PlayButtonStack extends StatelessWidget {
  const PlayButtonStack({
    required this.height,
    required this.width,
    required this.playIconSize
  }) ;

  final double height;
  final double width;
  final double playIconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
          Border.all(color: Colors.white, width: 2),
          color: Colors.black.withOpacity(0.6)
      ),
      child: Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: playIconSize,
      ),
    );
  }
}