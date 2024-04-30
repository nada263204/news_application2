// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:news_application/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(drawerItem) onItemSelected;
  const HomeDrawer(this.onItemSelected);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.85,
      child: Column(
        children: [
          Container(
            color: appTheme.primaryColor,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text('News App!',
            style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),)),
          ),
          Expanded(child: Container(color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: (){
                      onItemSelected(drawerItem.Categories);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(width: 8,),
                        Text('Categories',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: (){
                      onItemSelected(drawerItem.settings);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 8,),
                        Text('Setting',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),)
                      ],
                    ),
                  ),
                ),
                ],
            ),
          ),))
        ],
      ),
    );
  }
}

enum drawerItem{
  Categories,
  settings,
}


