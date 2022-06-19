import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';
import 'package:sj_member_app/core/Services/dio_service.dart';
import 'package:sj_member_app/core/Services/endpoints.dart';
import 'package:sj_member_app/core/enums/viewState.dart';
import 'package:sj_member_app/locator.dart';

class AccountDetailsViewModel extends ChangeNotifier {
  DioService _dioService = locator<DioService>();
  late EquitySharingFormList equitySharingFormList;
  ViewState _viewState = ViewState.Idle;
  double investmentTotal = 0.0;
  double compoundingTotal = 0.0;

  ViewState getViewState() => _viewState;
  void setViewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  Future getMemberAccountDetails(String memberID) async {
    try {
      setViewState(ViewState.Busy);
      Response response = await _dioService.get().get(
          '''$baseUrl/$GET_equity_sharing_form?fields=["creation","name","sharing_type","member","capital_amount","compounding_tenure","schedule_release_date","approval_status"]''');
      if (response.statusCode == 200) {
        equitySharingFormList = EquitySharingFormList.fromJson(response.data);
        equitySharingFormList.data.forEach((element) {
          if (element.sharingType == "Compound Interest") {
            compoundingTotal = compoundingTotal + element.capitalAmount!;
          } else if (element.sharingType == "Monthly Profit Share") {
            investmentTotal = investmentTotal + element.capitalAmount!;
          }
        });
      }
      setViewState(ViewState.Idle);
    } catch (e) {
      setViewState(ViewState.Error);
    }
  }
}
