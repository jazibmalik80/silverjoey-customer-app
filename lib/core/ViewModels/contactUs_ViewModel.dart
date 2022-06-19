import 'package:flutter/cupertino.dart';
import 'package:sj_member_app/core/Models/member_profiles/mem_prof_model.dart';
import 'package:sj_member_app/core/Models/services/service_model.dart';
import 'package:sj_member_app/core/Services/support_service.dart';
import 'package:sj_member_app/core/enums/viewState.dart';
import 'package:sj_member_app/locator.dart';

class ContactUsViewModel extends ChangeNotifier {
  ContactSupportService contactService = locator<ContactSupportService>();
  ViewState viewState = ViewState.Idle;
  MemberProfileList? memberList;
  ServiceList? serviceList;

  Future fetchOfferedServices() async {
    // print("Services Fetching");
    viewState = ViewState.Busy;
    notifyListeners();

    serviceList = await contactService.getServices();

    viewState = ViewState.Idle;
    notifyListeners();
    // print("Service Info Fetched");
  }

  Future addContactUsDetail(
      String contactMessage, String serviceID, String memberID) async {
    viewState = ViewState.Busy;
    notifyListeners();
    await contactService.postContactUsDetail(
        contactMessage, serviceID, memberID);
    viewState = ViewState.Idle;
    notifyListeners();
  }
}
