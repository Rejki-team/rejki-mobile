// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: json['id'] as String,
  posterId: json['poster_id'] as String,
  judul: json['judul'] as String,
  perusahaan: json['perusahaan'] as String,
  deskripsi: json['deskripsi'] as String,
  lokasi: json['lokasi'] as String?,
  gajiMin: (json['gaji_min'] as num?)?.toInt(),
  gajiMax: (json['gaji_max'] as num?)?.toInt(),
  tipe: json['tipe'] as String,
  fotoUrls:
      (json['foto_urls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  status: json['status'] as String,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  'id': instance.id,
  'poster_id': instance.posterId,
  'judul': instance.judul,
  'perusahaan': instance.perusahaan,
  'deskripsi': instance.deskripsi,
  'lokasi': instance.lokasi,
  'gaji_min': instance.gajiMin,
  'gaji_max': instance.gajiMax,
  'tipe': instance.tipe,
  'foto_urls': instance.fotoUrls,
  'status': instance.status,
  'created_at': instance.createdAt,
};
