import 'package:flutter/material.dart';
import 'package:news_application/API/api_service.dart';
import 'package:news_application/News/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIServices.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else if (snapshot.data?.status != 'ok') {
          return const Center(child: Text('Something went wrong'));
        }
        final newsList = snapshot.data?.news ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsItem(newsList[index]);
            },
          ),
        );
      },
    );
  }
}
