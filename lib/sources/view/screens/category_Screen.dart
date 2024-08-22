// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:news_application/sources/view/widgets/category_item.dart';
import 'package:news_application/sources/view/widgets/category_model.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({
    Key? key,
    required this.onCategorySelected,
  }) : super(key: key);
  final void Function(categoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemCount: categoryModel.Categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategorySelected(categoryModel.Categories[index]);
                  },
                  child: category_item(
                    category: categoryModel.Categories[index],
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
