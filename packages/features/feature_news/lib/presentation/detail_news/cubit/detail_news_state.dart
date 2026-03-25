import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_news_state.freezed.dart';

@freezed
abstract class DetailNewsState with _$DetailNewsState {
  const factory DetailNewsState({
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DetailNewsState;
}
