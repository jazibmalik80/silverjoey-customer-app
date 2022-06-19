import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sj_member_app/core/Models/member_profiles/mem_prof_model.dart';
import 'package:sj_member_app/core/Services/authentication_service.dart';

import '../../locator.dart';

enum AUTH_STATES { LoggedIn, LoggingIn, LoggedOut, TokenNotFound }

class AuthenticationViewmodel extends ChangeNotifier {
  AUTH_STATES _authState = AUTH_STATES.LoggedOut;

  AUTH_STATES getGlobalAuthState() => _authState;

  AUTH_STATES setGlobalAuthState({required AUTH_STATES newState}) {
    _authState = newState;
    return _authState;
  }

  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  MemberProfileList? memberProfileList;

  Future loadMemberProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String loggedInFrappeUserEmail = preferences.getString("frappe_user") ?? "";
    if (loggedInFrappeUserEmail.isNotEmpty) {
      _authState = AUTH_STATES.LoggingIn;
      notifyListeners();
      try {
        _authState = AUTH_STATES.LoggingIn;
        notifyListeners();
        memberProfileList = await _authenticationService
            .getLoggedInMemberInfo(loggedInFrappeUserEmail);
        _authState = AUTH_STATES.LoggedIn;
        // print(memberProfileList?.data.first.frappeUser ?? "what the duck");
        notifyListeners();
      } catch (e) {
        _authState = AUTH_STATES.LoggedOut;
        notifyListeners();
      }
    } else {
      _authState = AUTH_STATES.LoggedOut;
      notifyListeners();
    }
  }

  Future logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("frappe_user", "");
    _authState = AUTH_STATES.LoggedOut;
    notifyListeners();
  }
}
