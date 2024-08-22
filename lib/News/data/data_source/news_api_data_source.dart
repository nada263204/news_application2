import 'package:news_application/shared/api_constanats.dart';
import 'package:news_application/News/data/models/newsModel.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsAPIDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
    try {
      final uri = Uri.https(APIConstants.baseUrl, APIConstants.newsEndpoint, {
        "apikey": APIConstants.apiKey,
        "sources": sourceId,
      });
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
