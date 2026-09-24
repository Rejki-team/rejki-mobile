// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lamaran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LamaranModel _$LamaranModelFromJson(Map<String, dynamic> json) =>
    _LamaranModel(
      id: json['id'] as String,
      iklanId: json['iklan_id'] as String,
      pelamarId: json['pelamar_id'] as String,
      status: json['status'] as String,
      tanggal: json['tanggal'] as String,
      jamMulai: json['jam_mulai'] as String,
      jamAkhir: json['jam_akhir'] as String,
      kuotaDiambil: (json['kuota_diambil'] as num?)?.toInt() ?? 1,
      alasanBatal: json['alasan_batal'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      pelamarNama: json['pelamar_nama'] as String?,
      pelamarIklanPekerjaId: json['pelamar_iklan_pekerja_id'] as String?,
      pelamarKeahlian: (json['pelamar_keahlian'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pelamarFotoUrl: json['pelamar_foto_url'] as String?,
      iklanJudul: json['iklan_judul'] as String?,
      iklanPerusahaan: json['iklan_perusahaan'] as String?,
      iklanGajiMin: (json['iklan_gaji_min'] as num?)?.toInt(),
      iklanGajiMax: (json['iklan_gaji_max'] as num?)?.toInt(),
      iklanTipe: json['iklan_tipe'] as String?,
      iklanLokasi: json['iklan_lokasi'] as String?,
      iklanPosterId: json['iklan_poster_id'] as String?,
    );

Map<String, dynamic> _$LamaranModelToJson(_LamaranModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iklan_id': instance.iklanId,
      'pelamar_id': instance.pelamarId,
      'status': instance.status,
      'tanggal': instance.tanggal,
      'jam_mulai': instance.jamMulai,
      'jam_akhir': instance.jamAkhir,
      'kuota_diambil': instance.kuotaDiambil,
      'alasan_batal': instance.alasanBatal,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pelamar_nama': instance.pelamarNama,
      'pelamar_iklan_pekerja_id': instance.pelamarIklanPekerjaId,
      'pelamar_keahlian': instance.pelamarKeahlian,
      'pelamar_foto_url': instance.pelamarFotoUrl,
      'iklan_judul': instance.iklanJudul,
      'iklan_perusahaan': instance.iklanPerusahaan,
      'iklan_gaji_min': instance.iklanGajiMin,
      'iklan_gaji_max': instance.iklanGajiMax,
      'iklan_tipe': instance.iklanTipe,
      'iklan_lokasi': instance.iklanLokasi,
      'iklan_poster_id': instance.iklanPosterId,
    };
