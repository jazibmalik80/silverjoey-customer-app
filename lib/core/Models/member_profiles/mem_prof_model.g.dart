// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mem_prof_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberProfileList _$MemberProfileListFromJson(Map<String, dynamic> json) {
  return MemberProfileList(
    data: (json['data'] as List<dynamic>)
        .map((e) => MemberProfileData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MemberProfileListToJson(MemberProfileList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

MemberProfileData _$MemberProfileDataFromJson(Map<String, dynamic> json) {
  return MemberProfileData(
    name: json['name'] as String?,
    dateJoined: json['date_joined'] as String?,
    firstName: json['first_name'] as String?,
    middleName: json['middle_name'] as String?,
    lastName: json['last_name'] as String?,
    frappeUser: json['frappe_user'] as String?,
    phone: json['phone'] as String?,
    fullAddress: json['full_address'] as String?,
  );
}

Map<String, dynamic> _$MemberProfileDataToJson(MemberProfileData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date_joined': instance.dateJoined,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'frappe_user': instance.frappeUser,
      'phone': instance.phone,
      'full_address': instance.fullAddress,
    };
