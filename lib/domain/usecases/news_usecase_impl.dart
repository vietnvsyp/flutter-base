import 'package:eminel_app/data/models/news.dart';
import 'package:eminel_app/data/repositories/news_repository.dart';
import 'package:eminel_app/domain/translator/news_translator.dart';
import 'package:eminel_app/domain/usecases/news_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsUsecaseImpl implements NewsUsecase {
  final NewsRepository _repository;

  const NewsUsecaseImpl(this._repository);

  @override
  Future<List<News>> getAllNews(String content, String from, String apiKey) async {

    // TODO: implement getAllNews
    // final prefs = await SharedPreferences.getInstance();
    final entities = await _repository.getAllNews(content, from, apiKey);
    final news = NewsTranslator.translate(entities);

    return news;
  }
}
