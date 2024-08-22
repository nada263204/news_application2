import 'dart:convert';

import 'package:news_application/shared/api_constanats.dart';
import 'package:http/http.dart' as http;

import 'package:news_application/sources/data/models/sourceModel.dart';

class SourcesAPIDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
    try {
      final uri = Uri.https(APIConstants.baseUrl, APIConstants.sourcesEndpoint,
          {"apikey": APIConstants.apiKey, "category": categoryId});
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return SourcesResponse.fromJson(json);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
