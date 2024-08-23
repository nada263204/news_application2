import 'package:flutter/material.dart';
import 'package:news_application/News/data/models/newsModel.dart';
import 'package:news_application/News/data/repository/news_repository.dart';
import 'package:news_application/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository repository;
  bool isLoading = false;
  List<News> newsList = [];
  String? errorMessage;

  NewsViewModel() {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }
  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      newsList = await repository.getNews(sourceId);
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
