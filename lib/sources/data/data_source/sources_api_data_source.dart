import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/shared/api_constanats.dart';
import 'package:news_application/sources/data/data_source/sources_data_source.dart';
import 'package:news_application/sources/data/models/sourceModel.dart';

class SourcesAPIDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(
      APIConstants.baseUrl,
      APIConstants.sourcesEndpoint,
      {
        'apiKey': APIConstants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get sources!');
    }
  }
}
