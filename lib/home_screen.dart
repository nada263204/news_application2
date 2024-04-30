import 'package:flutter/material.dart';
import 'package:news_application/category/Categories_details.dart';
import 'package:news_application/category/category_Screen.dart';
import 'package:news_application/category/category_model.dart';
import 'package:news_application/drawer/home_drawer.dart';
import 'package:news_application/setting/setting_tab.dart';

class HomeScreen extends StatefulWidget {
static const String routeName ='/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png'),
        fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        drawer: HomeDrawer(onDrawerItemSelected),
        appBar: AppBar(
          title:Text(
            selectedCategory != null ?
            selectedCategory!.title:
            SelectedDrawerItem == drawerItem.settings ? 'Setting':'News App'),
        ),
        body:selectedCategory != null ? CategoriesDetails(selectedCategory!.id):
        SelectedDrawerItem == drawerItem.settings ? SettingTab()
        :CategoryScreen(onCategorySelected:onCategorySelected) ,
      ),
    );
  }

  drawerItem SelectedDrawerItem = drawerItem.Categories ;
  categoryModel? selectedCategory ;
  void onDrawerItemSelected(drawerItem selectedItem) {
    SelectedDrawerItem =selectedItem;
  if(selectedItem == drawerItem.Categories){
    print("category");
  }
  else if(selectedItem == drawerItem.settings){
    print("setting");
  }
  selectedCategory =null;
  Navigator.of(context).pop();
  setState(() {});
}

void onCategorySelected(categoryModel category) {
  selectedCategory = category;
  setState(() {});
}
}


