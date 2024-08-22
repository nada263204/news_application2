// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class categoryModel {
  final String id;
  final String title;
  final String imageName;
  final Color color;
  categoryModel({
    required this.id,
    required this.title,
    required this.imageName,
    required this.color,
  });
  static List<categoryModel> Categories = [
    categoryModel(
      id: 'business',
      title: 'Business',
      imageName: 'assets/images/bussines.png',
      color: Color(0XFFCF7E48),
    ),
    categoryModel(
      id: 'entertainment',
      title: 'Entertainment',
      imageName: 'assets/images/environment.png',
      color: Color(0XFF4882CF),
    ),
    categoryModel(
      id: 'sports',
      title: 'Sports',
      imageName: 'assets/images/ball.png',
      color: Colors.red,
    ),
    categoryModel(
      id: 'science',
      title: 'Science',
      imageName: 'assets/images/science.png',
      color:Color(0XFFF2D352)
    ),
    categoryModel(
      id: 'health',
      title: 'Health',
      imageName: 'assets/images/health.png',
      color: Color(0XFFED1E79),
    ),
    categoryModel(
      id: 'general',
      title: 'General',
      imageName: 'assets/images/Politics.png',
      color: Color(0XFF003E90),
    ),
  ];
  }
