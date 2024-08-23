import 'package:flutter/material.dart';
import 'package:news_application/shared/service_locator.dart';
import 'package:news_application/sources/data/models/sourceModel.dart';
import 'package:news_application/sources/data/repository/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesRepository repository;
  SourcesViewModel() {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await repository.getSource(categoryId);
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
