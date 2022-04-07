import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Content {
  final String name;
  final String imageUrl;
  final String titleImageUrl;
  final String videoUrl;
  final String description;
  Color color;
  final String text;
  String logo;
  bool tickValue;
  bool myListCheck;
  bool like;

   Content({
    required this.name,
    required this.imageUrl,
    this.titleImageUrl='',
    this.videoUrl='',
    this.description='',
    this.color=Colors.white,
    this.text='movie',
    this.tickValue=false,
     this.logo='',
     this.myListCheck=false,
     this.like = false,
  });
}
