// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_application/category/category_model.dart';

class category_item extends StatelessWidget {
  final categoryModel category;
  final int index;
  category_item({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color:category.color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft:Radius.circular(index.isEven ? 30 :0),
        bottomRight:Radius.circular(index.isOdd ? 30 :0),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imageName),
          Text(category.title,style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
