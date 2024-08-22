// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/models/newsModel.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (_, __) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => const Center(
                  child: Icon(
                Icons.error_outline_outlined,
                size: 40,
              )),
            ),
          ),
          Text(news.source?.name ?? '',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              )),
          Text(news.title ?? '',
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(timeago.format(news.publishedAt!),
                style: const TextStyle(fontSize: 18, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
