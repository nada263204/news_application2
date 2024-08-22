// import 'package:news_application/models/sourceModel.dart';

// class NewsResponse {
//   String? status;
//   int? totalResults;
//   List<Article>? articles;
//   String? message;
//   NewsResponse({this.status, this.totalResults, this.articles, this.message});

//   NewsResponse.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     totalResults = json["totalResults"];
//     message = json['message'];
//     articles = json["articles"] == null
//         ? null
//         : (json["articles"] as List).map((e) => Article.fromJson(e)).toList();
//   }
// }

// class Article {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   String? publishedAt;
//   String? content;

//   Article(
//       {this.source,
//       this.author,
//       this.title,
//       this.description,
//       this.url,
//       this.urlToImage,
//       this.publishedAt,
//       this.content});

//   Article.fromJson(Map<String, dynamic> json) {
//     source = json["source"] == null ? null : Source.fromJson(json["source"]);
//     author = json["author"];
//     title = json["title"];
//     description = json["description"];
//     url = json["url"];
//     urlToImage = json["urlToImage"];
//     publishedAt = (json['publishedAt'] == null
//         ? null
//         : DateTime.parse(json['publishedAt'])) as String?;

//     content = json["content"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (source != null) {
//       data["source"] = source?.toJson();
//     }
//     data["author"] = author;
//     data["title"] = title;
//     data["description"] = description;
//     data["url"] = url;
//     data["urlToImage"] = urlToImage;
//     data["publishedAt"] = publishedAt;
//     data["content"] = content;
//     return data;
//   }
// }
import 'package:news_application/sources/models/sourceModel.dart';

class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<News>? news;

  const NewsResponse({this.status, this.totalResults, this.news});

  @override
  String toString() {
    return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $news)';
  }

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        news: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class News {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  String toString() {
    return 'Article(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  factory News.fromJson(Map<String, dynamic> json) => News(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json['publishedAt'] as String),
        content: json['content'] as String?,
      );
}
