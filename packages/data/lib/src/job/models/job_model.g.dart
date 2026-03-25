// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: json['id'] as String,
  adCode: json['ad_code'] as String,
  userId: json['user_id'] as String,
  user: json['user'] == null
      ? null
      : UserJobModel.fromJson(json['user'] as Map<String, dynamic>),
  title: json['title'] as String,
  jobDesc: json['job_desc'] as String,
  jobRequirements: json['job_requirements'] as String?,
  salary: (json['salary'] as num).toInt(),
  salaryOfWorker: json['salary_of_worker'] as String,
  numberOfWorker: (json['number_of_worker'] as num).toInt(),
  dateOfJob: json['date_of_job'] as String,
  address: json['address'] as String,
  province: json['province'] as String,
  city: json['city'] as String,
  subdistrict: json['subdistrict'] as String,
  ward: json['ward'] as String,
  village: json['village'] as String?,
  status: json['status'] as String,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => JobImageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  'id': instance.id,
  'ad_code': instance.adCode,
  'user_id': instance.userId,
  'user': instance.user,
  'title': instance.title,
  'job_desc': instance.jobDesc,
  'job_requirements': instance.jobRequirements,
  'salary': instance.salary,
  'salary_of_worker': instance.salaryOfWorker,
  'number_of_worker': instance.numberOfWorker,
  'date_of_job': instance.dateOfJob,
  'address': instance.address,
  'province': instance.province,
  'city': instance.city,
  'subdistrict': instance.subdistrict,
  'ward': instance.ward,
  'village': instance.village,
  'status': instance.status,
  'images': instance.images,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
