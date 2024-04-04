import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';

@freezed
abstract class News with _$News {
  const factory News({
    required final String author,
    required final String title,
    required final String description,
    required final String url,
    required final String content,
  }) = _News;
}
