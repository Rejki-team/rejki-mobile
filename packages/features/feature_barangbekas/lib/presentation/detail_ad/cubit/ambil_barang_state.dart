import 'package:freezed_annotation/freezed_annotation.dart';

part 'ambil_barang_state.freezed.dart';

@freezed
sealed class AmbilBarangState with _$AmbilBarangState {
  const factory AmbilBarangState.initial() = _Initial;
  const factory AmbilBarangState.submitting() = _Submitting;
  const factory AmbilBarangState.success() = _Success;
  const factory AmbilBarangState.failure(String message) = _Failure;
}
