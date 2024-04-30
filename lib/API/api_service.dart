import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/API/api_constanats.dart';
import 'package:news_application/models/newsModel.dart';
import 'package:news_application/models/sourceModel.dart';

class APIServices {
  static Future<SourcesResponse> getSources(String categoryId) async {
    try {
      final uri = Uri.https(
        APIConstants.baseUrl,
       APIConstants.sourcesEndpoint,
        {
          "apikey": APIConstants.apiKey,
          "category": categoryId
          }
        );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
   static Future<NewsResponse> getNews(String sourceId) async {
    try {
      final uri = Uri.https(
        APIConstants.baseUrl,
       APIConstants.newsEndpoint,
        {
          "apikey": APIConstants.apiKey,
          "sources":sourceId,
          }
        );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
