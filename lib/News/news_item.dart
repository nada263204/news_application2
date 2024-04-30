// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_application/models/newsModel.dart';

class NewsItem extends StatelessWidget {
  final Article news;
  const NewsItem(
     this.news,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ClipRRect(
          borderRadius: BorderRadius.circular(4),
           child: CachedNetworkImage(
            imageUrl: news.urlToImage ?? '',
            placeholder: (_,__)=> Center(child: CircularProgressIndicator()),
            errorWidget: (_,__,___)=>Center(child: Icon(Icons.error)),
            ),
         ),
          Text(news.source?.name ?? '',
              style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
              )
              ),
              Text(news.title ?? '',
              style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
          color: Colors.black
              )
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(news.publishedAt.toString(),
                style:TextStyle(
                  fontSize: 18,
                          color: Colors.grey
                )
                ),
              ),
        ],
      ),
    );
  }
}
