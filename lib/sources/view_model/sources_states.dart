import 'package:news_application/sources/data/models/sourceModel.dart';

abstract class SourcesStates {}

class SourcesInitial extends SourcesStates {}

class SourcesLoading extends SourcesStates {}

class SourcesSuccess extends SourcesStates {
  final List<Source> sources;

  SourcesSuccess(this.sources);
}

class SourcesError extends SourcesStates {
  final String message;

  SourcesError(this.message);
}
