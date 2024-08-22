// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:news_application/News/view/news_list.dart';
import 'package:news_application/sources/data/models/sourceModel.dart';

import 'package:news_application/sources/view/widgets/tab_item.dart';

class Tabs extends StatefulWidget {
  final List<Source> sources;
  const Tabs(
    this.sources,
  );

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sources
                .map((source) => tabItem(
                    source: source,
                    isSelected:
                        selectedIndex == widget.sources.indexOf(source)))
                .toList(),
          ),
        ),
        NewsList(sourceId: widget.sources[selectedIndex].id ?? ''),
      ],
    );
  }
}
