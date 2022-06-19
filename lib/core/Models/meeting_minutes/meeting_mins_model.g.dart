// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_mins_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingMinsList _$MeetingMinsListFromJson(Map<String, dynamic> json) {
  return MeetingMinsList(
    data: (json['data'] as List<dynamic>)
        .map((e) => MeetingData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MeetingMinsListToJson(MeetingMinsList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

MeetingData _$MeetingDataFromJson(Map<String, dynamic> json) {
  return MeetingData(
    name: json['name'] as String,
    meeting: json['meeting'] as String,
    logEntry: json['logEntry'] as String,
    creation: json['creation'] as String,
  );
}

Map<String, dynamic> _$MeetingDataToJson(MeetingData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'meeting': instance.meeting,
      'logEntry': instance.logEntry,
      'creation': instance.creation,
    };
