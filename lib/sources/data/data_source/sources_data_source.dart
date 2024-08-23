import 'package:news_application/sources/data/models/sourceModel.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSources(String categoryId);
}
