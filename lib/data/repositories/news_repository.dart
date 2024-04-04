

import 'package:eminel_app/data/entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getAllNews(String content, String from, String apiKey);
}
