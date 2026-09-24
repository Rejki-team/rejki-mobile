// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondhand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecondhandModel _$SecondhandModelFromJson(Map<String, dynamic> json) =>
    _SecondhandModel(
      id: json['id'] as String,
      sellerId: json['seller_id'] as String,
      judul: json['judul'] as String,
      deskripsi: json['deskripsi'] as String,
      jenisBarang: json['jenis_barang'] as String,
      jumlah: (json['jumlah'] as num).toInt(),
      lokasiPengambilan: json['lokasi_pengambilan'] as String,
      lokasi: json['lokasi'] as String?,
      regionId: json['region_id'] as String?,
      fotoUrls:
          (json['foto_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      availabilityStatus: json['availability_status'] as String,
      moderationStatus: json['moderation_status'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$SecondhandModelToJson(_SecondhandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seller_id': instance.sellerId,
      'judul': instance.judul,
      'deskripsi': instance.deskripsi,
      'jenis_barang': instance.jenisBarang,
      'jumlah': instance.jumlah,
      'lokasi_pengambilan': instance.lokasiPengambilan,
      'lokasi': instance.lokasi,
      'region_id': instance.regionId,
      'foto_urls': instance.fotoUrls,
      'availability_status': instance.availabilityStatus,
      'moderation_status': instance.moderationStatus,
      'created_at': instance.createdAt,
    };
