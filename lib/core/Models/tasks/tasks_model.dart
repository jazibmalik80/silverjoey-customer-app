import 'package:json_annotation/json_annotation.dart';

part 'tasks_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TasksList {
  List<TasksData> data;

  TasksList({required this.data});

  factory TasksList.fromJson(Map<String, dynamic> data) =>
      _$TasksListFromJson(data);

  Map<String, dynamic> toJson() => _$TasksListToJson(this);
}

@JsonSerializable()
class TasksData {
  String name;
  String status;
  String date;
  String priority;
  String owner;
  String description;
  String creation;

  TasksData(
      {required this.name,
      required this.status,
      required this.date,
      required this.priority,
      required this.owner,
      required this.description,
      required this.creation});

  factory TasksData.fromJson(Map<String, dynamic> data) =>
      _$TasksDataFromJson(data);

  Map<String, dynamic> toJson() => _$TasksDataToJson(this);
}
