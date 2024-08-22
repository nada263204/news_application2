import 'package:flutter/material.dart';
import 'package:news_application/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_application/sources/data/models/sourceModel.dart';

class SourcesViewModel with ChangeNotifier {
  final SourcesAPIDataSource apiDataSource = SourcesAPIDataSource();
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await apiDataSource.getSources(categoryId);
      if (response.status == 'ok') {
        sources = response.sources ?? [];
        isLoading = false;
        notifyListeners();
      } else {
        errorMessage = 'Failed to get sources';
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
