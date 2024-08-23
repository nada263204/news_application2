import 'package:news_application/News/data/data_source/news_data_source.dart';
import 'package:news_application/shared/api_constanats.dart';
import 'package:news_application/News/data/models/newsModel.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsAPIDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
    final uri = Uri.https(APIConstants.baseUrl, APIConstants.newsEndpoint, {
      "apikey": APIConstants.apiKey,
      "sources": sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.news != null) {
      return newsResponse.news!;
    } else {
      throw Exception('Failed to get news');
    }
  }
}
