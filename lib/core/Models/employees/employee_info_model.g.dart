// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeList _$EmployeeListFromJson(Map<String, dynamic> json) {
  return EmployeeList(
    data: (json['data'] as List<dynamic>)
        .map((e) => EmployeeData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EmployeeListToJson(EmployeeList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

EmployeeData _$EmployeeDataFromJson(Map<String, dynamic> json) {
  return EmployeeData(
    name: json['name'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    frappeUser: json['frappeUser'] as String,
    designation: json['designation'] as String,
    profilePicture: json['profilePicture'] as String,
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$EmployeeDataToJson(EmployeeData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'frappeUser': instance.frappeUser,
      'designation': instance.designation,
      'profilePicture': instance.profilePicture,
      'fullName': instance.fullName,
    };
