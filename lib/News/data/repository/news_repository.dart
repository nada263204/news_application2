import 'package:news_application/News/data/data_source/news_data_source.dart';
import 'package:news_application/News/data/models/newsModel.dart';

class NewsRepository {
  final NewsDataSource dataSource;

  NewsRepository(this.dataSource);
  Future<List<News>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }
}
