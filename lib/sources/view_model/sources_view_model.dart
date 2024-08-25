import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/service_locator.dart';
import 'package:news_application/sources/data/repository/sources_repository.dart';
import 'package:news_application/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  SourcesViewModel() : super(SourcesInitial()) {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  late final SourcesRepository repository;

  Future<void> getSources(String categoryId) async {
    emit(SourcesLoading());
    try {
      final sources = await repository.getSource(categoryId);
      emit(SourcesSuccess(sources));
    } catch (e) {
      emit(SourcesError(e.toString()));
    }
  }
}














// class SourcesViewModel with ChangeNotifier {
//   late final SourcesRepository repository;
//   SourcesViewModel() {
//     repository = SourcesRepository(ServiceLocator.sourcesDataSource);
//   }
//   List<Source> sources = [];
//   bool isLoading = false;
//   String? errorMessage;

//   Future<void> getSources(String categoryId) async {
//     isLoading = true;
//     notifyListeners();
//     try {
//       sources = await repository.getSource(categoryId);
//     } catch (e) {
//       errorMessage = e.toString();
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
