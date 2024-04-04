import 'package:eminel_app/data/entities/news_entity.dart';
import 'package:eminel_app/data/models/news.dart';

class NewsTranslator {
  static List<News> translate(final List<NewsEntity> entities) {
    final news = entities
        .map((e) => News(
              author: e.author,
              title: e.title,
              description: e.description,
              url: e.url,
              content: e.content,
            ))
        .toList();
    return news;
  }
}
