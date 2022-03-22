import 'package:equatable/equatable.dart';
import 'package:flutter_articles/models/author.dart';

class Article extends Equatable {
  final int id;
  final String title;
  final String description;
  final String readablePublishDate;
  final String url;
  final int commentsCount;
  final int positiveReactionsCount;
  final String publishedTimestamp;
  final String? coverImage;
  final int readingTimeMinutes;
  final List<String> tags;
  final String? bodyHtml;
  final String? bodyMarkdown;
  final Author? author;

  const Article({
    required this.id,
    required this.title,
    required this.description,
    required this.readablePublishDate,
    required this.url,
    required this.commentsCount,
    required this.publishedTimestamp,
    required this.positiveReactionsCount,
    this.coverImage,
    required this.readingTimeMinutes,
    required this.tags,
    this.bodyHtml,
    this.bodyMarkdown,
    this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      readablePublishDate: json['readable_publish_date'],
      url: json['url'],
      commentsCount: json['comments_count'],
      publishedTimestamp: json['published_timestamp'],
      positiveReactionsCount: json['positive_reactions_count'],
      coverImage: json['cover_image'],
      readingTimeMinutes: json['reading_time_minutes'],
      tags: List<String>.from((json['tag_list'] is String ? json['tags'] : json['tag_list']).map((x) => x)),
      bodyHtml: json['body_html'],
      bodyMarkdown: json['body_markdown'],
      author: json['user'] == null ? null : Author.fromJson(json['user']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        readablePublishDate,
        url,
        commentsCount,
        positiveReactionsCount,
        publishedTimestamp,
        coverImage,
        readingTimeMinutes,
        tags,
        bodyHtml,
        bodyMarkdown,
        author,
      ];
}
