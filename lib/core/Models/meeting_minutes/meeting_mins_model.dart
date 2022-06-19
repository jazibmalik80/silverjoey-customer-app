import 'package:json_annotation/json_annotation.dart';

part 'meeting_mins_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MeetingMinsList {
  List<MeetingData> data;

  MeetingMinsList({required this.data});

  factory MeetingMinsList.fromJson(Map<String, dynamic> data) =>
      _$MeetingMinsListFromJson(data);

  Map<String, dynamic> toJson() => _$MeetingMinsListToJson(this);
}

@JsonSerializable()
class MeetingData {
  String name;
  String meeting;
  String logEntry;
  String creation;

  MeetingData(
      {required this.name,
      required this.meeting,
      required this.logEntry,
      required this.creation});

  factory MeetingData.fromJson(Map<String, dynamic> data) =>
      _$MeetingDataFromJson(data);

  Map<String, dynamic> toJson() => _$MeetingDataToJson(this);
}
