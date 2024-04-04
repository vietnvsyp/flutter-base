
import 'package:eminel_app/data/models/news.dart';

abstract class NewsUsecase {
  Future<List<News>> getAllNews(String content, String from, String apiKey);
}
