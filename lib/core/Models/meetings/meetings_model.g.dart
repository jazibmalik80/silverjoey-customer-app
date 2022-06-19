// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meetings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingList _$MeetingListFromJson(Map<String, dynamic> json) {
  return MeetingList(
    data: (json['data'] as List<dynamic>)
        .map((e) => MeetingData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MeetingListToJson(MeetingList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

MeetingData _$MeetingDataFromJson(Map<String, dynamic> json) {
  return MeetingData(
    name: json['name'] as String,
    title: json['title'] as String,
    agenda: json['agenda'] as String,
    meetingDate: json['meetingDate'] as String,
    notifyAllEmployees: json['notifyAllEmployees'] as int,
    creation: json['creation'] as String,
  );
}

Map<String, dynamic> _$MeetingDataToJson(MeetingData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'agenda': instance.agenda,
      'meetingDate': instance.meetingDate,
      'notifyAllEmployees': instance.notifyAllEmployees,
      'creation': instance.creation,
    };
