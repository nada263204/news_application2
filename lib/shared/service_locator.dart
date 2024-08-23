import 'package:news_application/News/data/data_source/news_api_data_source.dart';
import 'package:news_application/News/data/data_source/news_data_source.dart';
import 'package:news_application/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_application/sources/data/data_source/sources_data_source.dart';

//application about dependency invertion
class ServiceLocator {
  static SourcesDataSource sourcesDataSource = SourcesAPIDataSource();
  static NewsDataSource newsDataSource = NewsAPIDataSource();
}
