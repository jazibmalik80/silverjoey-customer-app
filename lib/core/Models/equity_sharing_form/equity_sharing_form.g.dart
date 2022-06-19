// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equity_sharing_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquitySharingFormList _$EquitySharingFormListFromJson(
    Map<String, dynamic> json) {
  return EquitySharingFormList(
    data: (json['data'] as List<dynamic>)
        .map((e) => EquitySharingForm.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EquitySharingFormListToJson(
        EquitySharingFormList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

EquitySharingForm _$EquitySharingFormFromJson(Map<String, dynamic> json) {
  return EquitySharingForm(
    creation: json['creation'] as String?,
    name: json['name'] as String?,
    sharingType: json['sharing_type'] as String?,
    member: json['member'] as String?,
    capitalAmount: (json['capital_amount'] as num?)?.toDouble(),
    compoundingTenure: json['compounding_tenure'] as String?,
    scheduleReleaseDate: json['schedule_release_date'] as String?,
    approvalStatus: json['approval_status'] as String?,
  );
}

Map<String, dynamic> _$EquitySharingFormToJson(EquitySharingForm instance) =>
    <String, dynamic>{
      'creation': instance.creation,
      'name': instance.name,
      'sharing_type': instance.sharingType,
      'member': instance.member,
      'capital_amount': instance.capitalAmount,
      'compounding_tenure': instance.compoundingTenure,
      'schedule_release_date': instance.scheduleReleaseDate,
      'approval_status': instance.approvalStatus,
    };
