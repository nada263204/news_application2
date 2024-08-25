import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/News/view/news_item.dart';
import 'package:news_application/News/view_model/news_states.dart';
import 'package:news_application/News/view_model/news_view_model.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsCubit();

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);

    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsError) {
          return const Center(child: Text('Error'));
        } else if (state is NewsSuccess) {
          final newsList = state.news;
          return Expanded(
            child: ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsItem(newsList[index]);
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
