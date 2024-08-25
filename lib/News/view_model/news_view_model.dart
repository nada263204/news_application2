import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/News/data/repository/news_repository.dart';
import 'package:news_application/News/view_model/news_states.dart';
import 'package:news_application/shared/service_locator.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial()) {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }
  late final NewsRepository repository;
  Future<void> getNews(String sourceId) async {
    emit(NewsLoading());
    try {
      final newsList = await repository.getNews(sourceId);
      emit(NewsSuccess(newsList));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
