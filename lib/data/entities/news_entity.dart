import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_entity.freezed.dart';
part 'news_entity.g.dart';

@freezed
abstract class NewsEntity with _$NewsEntity {
  const factory NewsEntity({
    required final String author,
    required final String title,
    required final String description,
    required final String url,
    required final String content,
  }) = _NewsEntity;

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsEntityFromJson(json);
}
