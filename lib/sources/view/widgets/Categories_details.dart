// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/sources/view/screens/tab_bar.dart';
import 'package:news_application/sources/view_model/sources_states.dart';
import 'package:news_application/sources/view_model/sources_view_model.dart';

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
    return BlocProvider(
        create: (_) => SourcesViewModel()..getSources(widget.categoryId),
        child: BlocBuilder<SourcesViewModel, SourcesStates>(
            builder: (context, state) {
          if (state is SourcesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SourcesError) {
            return const Icon(Icons.error_outline_outlined);
          } else if (state is SourcesSuccess) {
            final sources = state.sources;
            return Tabs(sources);
          } else {
            return const SizedBox();
          }
        }));
  }
}
