import 'package:eminel_app/data/entities/news_entity.dart';
import 'package:eminel_app/data/repositories/news_repository.dart';
import 'package:eminel_app/server/mui_service.dart';

class NewsRepositoryImpl implements NewsRepository {
  final MuiService muiService;

  const NewsRepositoryImpl(this.muiService);

  @override
  Future<List<NewsEntity>> getAllNews(String content, String from, String apiKey) async {
    // TODO: implement getAllNews
    return await muiService.getAllNews(content, from, apiKey);
  }
}