import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

import 'create_used_goods_ad_state.dart';

/// Upload foto DIHAPUS dari alur ini (P4.4) — backend `foto_urls` butuh
/// presigned-URL flow terpisah, belum di-wire (pola sama `create_job`,
/// Kelompok 3 Phase 2). GPS capture juga DIHAPUS — backend geocode server-side
/// dari `lokasi`/`region_id`, tidak menerima koordinat klien langsung di create.
class CreateUsedGoodsAdCubit extends Cubit<CreateUsedGoodsAdState> {
  final CreateSecondhandUseCase _createSecondhandUseCase;

  CreateUsedGoodsAdCubit(this._createSecondhandUseCase)
    : super(const CreateUsedGoodsAdState());

  void judulChanged(String value) => emit(state.copyWith(judul: value));
  void deskripsiChanged(String value) => emit(state.copyWith(deskripsi: value));
  void jenisBarangChanged(String value) =>
      emit(state.copyWith(jenisBarang: value));
  void jumlahChanged(String value) => emit(state.copyWith(jumlah: value));
  void lokasiPengambilanChanged(String value) =>
      emit(state.copyWith(lokasiPengambilan: value));
  void regionIdChanged(String value) => emit(state.copyWith(regionId: value));

  Future<void> submitAd() async {
    if (state.isRequesting || !state.isFormValid) return;

    final jumlah = int.tryParse(state.jumlah);
    if (jumlah == null) {
      emit(state.copyWith(errorMessage: 'Jumlah barang tidak valid.'));
      return;
    }

    emit(
      state.copyWith(isRequesting: true, isSuccess: false, errorMessage: null),
    );

    final params = CreateSecondhandParams(
      judul: state.judul,
      deskripsi: state.deskripsi,
      // Normalisasi — backend hanya menerima literal "bekas"/"baru" persis.
      jenisBarang: state.jenisBarang.trim().toLowerCase(),
      jumlah: jumlah,
      lokasiPengambilan: state.lokasiPengambilan,
      regionId: state.regionId,
    );

    final result = await _createSecondhandUseCase(params);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isRequesting: false,
          errorMessage: _mapFailureMessage(failure),
        ),
      ),
      (_) => emit(state.copyWith(isRequesting: false, isSuccess: true)),
    );
  }

  String _mapFailureMessage(SecondhandFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan dari server.',
      networkError: () => 'Tidak ada koneksi internet.',
      unauthorized: () => 'Sesi habis, silakan login ulang.',
      notFound: () => 'Data tidak ditemukan.',
      validationError: (msg) => msg,
      unknown: () => 'Terjadi kesalahan. Coba lagi.',
    );
  }
}
