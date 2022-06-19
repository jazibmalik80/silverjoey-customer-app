import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final Color primaryColor = Color(0xFF029247);

final TextStyle overlayStyle = TextStyle(letterSpacing: 1.25);

String formattedDateTime(String rawDate) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  var date1 = inputFormat.parse(rawDate);
  var outputFormat = DateFormat('dd MMM yy, HH:mm');
  return outputFormat.format(date1);
}

String formattedDateOnly(String rawDate) {
  var inputFormat = DateFormat('yyyy-MM-dd');
  var date1 = inputFormat.parse(rawDate);
  var outputFormat = DateFormat('dd MMM yyyy');
  return outputFormat.format(date1);
}

double calculateROI(double capitalAmount, int months) {
  double tenured = 0;
  for (int i = 0; i < months; i++) {
    tenured = tenured + ((capitalAmount) * 0.12);
    capitalAmount = tenured;
  }
  return tenured;
}

double calculateEOTB(double capitalAmount, int months) {
  if (months == 1) {
    double tenured = capitalAmount + (capitalAmount * 0.12);
    return capitalAmount + tenured;
  } else {
    double tenured = capitalAmount;
    for (int i = 0; i < months; i++) {
      tenured = tenured + ((capitalAmount) * 0.12);
      capitalAmount = tenured;
    }
    return capitalAmount;
  }
}

String formattedDateForUpload(DateTime rawDate) {
  var outputFormat = DateFormat('yyyy-MM-dd');
  return outputFormat.format(rawDate);
}

String getReleaseDateFromCreation(String? creation, String? tenureLength) {
  // print(creation);
  // print(tenureLength);
  DateTime dateTime = DateTime.parse(creation ?? DateTime.now().toString());
  if (tenureLength == "6 Months") {
    DateTime updated = dateTime.add(Duration(days: 180));
    //print(dateTime.toString());
    return formattedDateOnly(updated.toString());
  } else {
    DateTime updated = dateTime.add(Duration(days: 365));
    return formattedDateOnly(updated.toString());
  }
}
