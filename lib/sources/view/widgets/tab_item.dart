// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_application/sources/data/models/sourceModel.dart';

class tabItem extends StatelessWidget {
  final Source source;
  final bool isSelected;
  const tabItem({
    required this.source,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? primaryColor : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: TextStyle(color: isSelected ? Colors.white : primaryColor),
      ),
    );
  }
}
