import 'package:news_application/sources/data/data_source/sources_data_source.dart';
import 'package:news_application/sources/data/models/sourceModel.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;

  SourcesRepository(this.dataSource);

  Future<List<Source>> getSource(String categoryId) async {
    return await dataSource.getSources(categoryId);
  }
}
