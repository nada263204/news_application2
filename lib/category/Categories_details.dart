import 'package:flutter/material.dart';
import 'package:news_application/API/api_service.dart';
import 'package:news_application/category/tab_bar.dart';

class CategoriesDetails extends StatelessWidget {
  final String categoryId;
  const CategoriesDetails(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIServices.getSources(categoryId),
      builder: (context,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError){
          return const Center(child: Text('Error'));
        }
        else if (snapshot.data?.status != 'ok'){
          return const Center(child: Text('Something went wrong'));
        }
        final sources = snapshot.data?.sources ?? [];
        return Tabs(sources) ;
        }
      );
  }
}