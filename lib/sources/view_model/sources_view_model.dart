import 'package:flutter/material.dart';
import 'package:news_application/API/api_service.dart';
import 'package:news_application/sources/models/sourceModel.dart';

class SourcesViewModel with ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await APIServices.getSources(categoryId);
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
