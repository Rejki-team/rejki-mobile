// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BiderModel _$BiderModelFromJson(Map<String, dynamic> json) => _BiderModel(
  id: json['id'] as String,
  iklanId: json['iklan_id'] as String,
  peminatId: json['peminat_id'] as String,
  status: json['status'] as String,
  sudahMenghubungi: json['sudah_menghubungi'] as bool? ?? false,
  createdAt: json['created_at'] as String,
  peminatNama: json['peminat_nama'] as String?,
  kelurahan: json['kelurahan'] as String?,
  kecamatan: json['kecamatan'] as String?,
  jarakKm: (json['jarak_km'] as num?)?.toDouble(),
  iklanJudul: json['iklan_judul'] as String?,
  iklanDeskripsi: json['iklan_deskripsi'] as String?,
  iklanJenisBarang: json['iklan_jenis_barang'] as String?,
  iklanJumlah: (json['iklan_jumlah'] as num?)?.toInt(),
  iklanLokasiPengambilan: json['iklan_lokasi_pengambilan'] as String?,
  iklanFotoUrls:
      (json['iklan_foto_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  iklanAvailabilityStatus: json['iklan_availability_status'] as String?,
);

Map<String, dynamic> _$BiderModelToJson(_BiderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iklan_id': instance.iklanId,
      'peminat_id': instance.peminatId,
      'status': instance.status,
      'sudah_menghubungi': instance.sudahMenghubungi,
      'created_at': instance.createdAt,
      'peminat_nama': instance.peminatNama,
      'kelurahan': instance.kelurahan,
      'kecamatan': instance.kecamatan,
      'jarak_km': instance.jarakKm,
      'iklan_judul': instance.iklanJudul,
      'iklan_deskripsi': instance.iklanDeskripsi,
      'iklan_jenis_barang': instance.iklanJenisBarang,
      'iklan_jumlah': instance.iklanJumlah,
      'iklan_lokasi_pengambilan': instance.iklanLokasiPengambilan,
      'iklan_foto_urls': instance.iklanFotoUrls,
      'iklan_availability_status': instance.iklanAvailabilityStatus,
    };
