import 'package:flutter/material.dart';
import 'package:news_application/News/view/news_item.dart';
import 'package:news_application/News/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);

    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(builder: (_, value, __) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.errorMessage != null) {
          return const Center(child: Text('Error'));
        }
        final newsList = viewModel.newsList;
        return Expanded(
          child: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsItem(newsList[index]);
            },
          ),
        );
      }),
    );
  }
}
