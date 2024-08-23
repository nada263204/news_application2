import 'package:news_application/News/data/models/newsModel.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(String categoryId);
}
