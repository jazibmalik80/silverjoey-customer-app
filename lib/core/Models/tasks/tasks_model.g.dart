// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksList _$TasksListFromJson(Map<String, dynamic> json) {
  return TasksList(
    data: (json['data'] as List<dynamic>)
        .map((e) => TasksData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TasksListToJson(TasksList instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

TasksData _$TasksDataFromJson(Map<String, dynamic> json) {
  return TasksData(
    name: json['name'] as String,
    status: json['status'] as String,
    date: json['date'] as String,
    priority: json['priority'] as String,
    owner: json['owner'] as String,
    description: json['description'] as String,
    creation: json['creation'] as String,
  );
}

Map<String, dynamic> _$TasksDataToJson(TasksData instance) => <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'date': instance.date,
      'priority': instance.priority,
      'owner': instance.owner,
      'description': instance.description,
      'creation': instance.creation,
    };
