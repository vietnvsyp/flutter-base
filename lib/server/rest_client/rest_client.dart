import 'package:dio/dio.dart' hide Headers;
import 'package:eminel_app/data/entities/news_entity.dart';
import 'package:eminel_app/server/mui_api_endpoint.dart';
import 'package:retrofit/retrofit.dart';

import 'rest_client_endpoint.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(news)
  Future<HttpResponse<List<NewsEntity>>> getAllNews(
      @Path("content") content, @Path("from") from, @Path("apiKey") apiKey);
}

final client = RestClient(Dio(BaseOptions(contentType: 'application/json')),
    baseUrl: ApiEndpoint().baseURL());
