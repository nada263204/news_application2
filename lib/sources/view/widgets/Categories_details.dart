// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_application/sources/view/screens/tab_bar.dart';
import 'package:news_application/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoriesDetails extends StatefulWidget {
  final String categoryId;
  const CategoriesDetails(this.categoryId, {super.key});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  final viewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourcesViewModel>(builder: (_, viewModel, __) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.errorMessage != null) {
          return const Icon(Icons.error_outline_outlined);
        } else {
          final sources = viewModel.sources;
          return Tabs(sources);
        }
      }),
    );

    //  ChangeNotifierProvider(
    //     create: (_) => viewModel..getSources(widget.categoryId),
    //     child:
    //      Builder(builder: (_) {
    //       if (viewModel.isLoading) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (viewModel.errorMessage != null) {
    //         return const Icon(Icons.error_outline_outlined);
    //       } else {
    //         final sources = viewModel.sources;
    //         return Tabs(sources);
    //       }
    //     }));
    //  FutureBuilder(
    //     future: APIServices.getSources(categoryId),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasError) {
    //         return const Center(child: Text('Error'));
    //       } else if (snapshot.data?.status != 'ok') {
    //         return const Center(child: Text('Something went wrong'));
    //       }
    //       final sources = snapshot.data?.sources ?? [];
    //       return Tabs(sources);
    //     });
  }
}
