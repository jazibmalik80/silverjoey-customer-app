import 'package:flutter/cupertino.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';
import 'package:sj_member_app/core/Models/member_profiles/mem_prof_model.dart';
import 'package:sj_member_app/core/Services/equity_service.dart';
import 'package:sj_member_app/core/Services/profile_service.dart';
import 'package:sj_member_app/core/enums/viewState.dart';
import 'package:sj_member_app/locator.dart';

class MemberInfoViewModel extends ChangeNotifier {
  ProfileService profileService = locator<ProfileService>();
  EquitySharingFormList? equitySharingFormList;
  ViewState viewState = ViewState.Idle;
  MemberProfileList? memberProfileList;

  Future getMemberData(String memberEmail, String memberID) async {
    viewState = ViewState.Busy;
    notifyListeners();

    memberProfileList = await profileService.getMemberInfo(memberEmail);
    //memberProfileList?.data.length ?? 0);

    viewState = ViewState.Idle;
    notifyListeners();
    await getMemberFirstEquity(memberID);
  }

  Future getMemberFirstEquity(String memberID) async {
    equitySharingFormList = await profileService.getMemberFirstEquity(memberID);
    if (equitySharingFormList != null) {
      notifyListeners();
    }
  }

  Future updateProfileInfo({
    required String profileID,
    required String profilefirstName,
    required String profilelastName,
    required String profileMiddleName,
    required String profileEmail,
    required String profilePhone,
    required String profileAddress,
  }) async {
    viewState = ViewState.Busy;
    notifyListeners();

    int? profileUpdateStatus = await profileService.putProfileInfo(
      profileID: profileID,
      profilefirstName: profilefirstName,
      profilelastName: profilelastName,
      profileMiddleName: profileMiddleName,
      profileEmail: profileEmail,
      profilePhone: profilePhone,
      profileAddress: profileAddress,
    );

    viewState = ViewState.Idle;
    notifyListeners();
  }
}
