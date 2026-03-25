import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.freezed.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    @Default(false) bool isLoading,
    @Default('Semuanya') String selectedFilter,
    String? errorMessage,
  }) = _NewsState;
}
