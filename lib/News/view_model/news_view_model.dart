import 'package:flutter/material.dart';
import 'package:news_application/News/data/data_source/news_api_data_source.dart';
import 'package:news_application/News/data/models/newsModel.dart';

class NewsViewModel with ChangeNotifier {
  final NewsAPIDataSource apiDataSource = NewsAPIDataSource();
  bool isLoading = false;
  List<News> newsList = [];
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await apiDataSource.getNews(sourceId);
      if (response.status == 'ok') {
        newsList = response.news ?? [];
      } else {
        errorMessage = 'Faild to get news';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
