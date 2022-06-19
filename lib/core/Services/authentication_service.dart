import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sj_member_app/core/Models/auth/login_credentials.dart';
import 'package:sj_member_app/core/Models/auth/login_error.dart';
import 'package:sj_member_app/core/Models/auth/login_success.dart';
import 'package:sj_member_app/core/Models/member_profiles/mem_prof_model.dart';

import '../../locator.dart';
import 'dio_service.dart';
import 'endpoints.dart';

class AuthenticationService {
  DioService _dioService = locator<DioService>();

  Future<LoginSuccess> loginUser(LoginCredentials loginCredentials) async {
    try {
      _dioService.setCookieInterceptorForDio();
      Response loginResponse = await _dioService.get().get(
          "$baseUrl/$loginRoute",
          queryParameters: loginCredentials.toJson());
      LoginSuccess loginSuccess = LoginSuccess.fromJson(loginResponse.data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("frappe_user", loginCredentials.identifier);
      _dioService.storeCookiesForFutureUse();
      return loginSuccess;
    } catch (e) {
      DioError dioError = e as DioError;
      throw LoginError.fromJson(dioError.response?.data);
    }
  }

  Future<MemberProfileList> getLoggedInMemberInfo(String frappeUser) async {
    _dioService.setCookieInterceptorForDio();
    _dioService.loadSavedCookies();
    // print("Frappe User: $frappeUser");
    try {
      Response employeeResponse = await _dioService.get().get(
          '''$baseUrl/$getMemberProfile&filters=[["frappe_user","=","$frappeUser"]]''');
      return MemberProfileList.fromJson(employeeResponse.data);
    } catch (e) {
      throw FlutterError("[Employee Profile Load] Something went wrong!");
    }
  }
}
