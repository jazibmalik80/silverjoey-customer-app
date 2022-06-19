import 'package:json_annotation/json_annotation.dart';

part 'equity_sharing_form.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class EquitySharingFormList {
  final List<EquitySharingForm> data;

  EquitySharingFormList({required this.data});

  factory EquitySharingFormList.fromJson(Map<String, dynamic> data) =>
      _$EquitySharingFormListFromJson(data);

  Map<String, dynamic> toJson() => _$EquitySharingFormListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class EquitySharingForm {
  String? creation;
  String? name;
  String? sharingType;
  String? member;
  double? capitalAmount;
  String? compoundingTenure;
  String? scheduleReleaseDate;
  String? approvalStatus;

  EquitySharingForm(
      {required this.creation,
      required this.name,
      required this.sharingType,
      required this.member,
      required this.capitalAmount,
      required this.compoundingTenure,
      required this.scheduleReleaseDate,
      required this.approvalStatus});

  factory EquitySharingForm.fromJson(Map<String, dynamic> data) =>
      _$EquitySharingFormFromJson(data);

  Map<String, dynamic> toJson() => _$EquitySharingFormToJson(this);
}
