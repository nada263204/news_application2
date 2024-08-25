import 'package:news_application/News/data/models/newsModel.dart';

abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class NewsLoading extends NewsStates {}

class NewsSuccess extends NewsStates {
  final List<News> news;

  NewsSuccess(this.news);
}

class NewsError extends NewsStates {
  final String message;

  NewsError(this.message);
}
