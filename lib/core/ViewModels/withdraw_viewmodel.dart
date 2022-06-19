import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';
import 'package:sj_member_app/core/Services/dio_service.dart';
import 'package:sj_member_app/core/Services/endpoints.dart';
import 'package:sj_member_app/core/enums/viewState.dart';
import 'package:sj_member_app/locator.dart';

class WithdrawViewModel extends ChangeNotifier {
  DioService _dioService = locator<DioService>();
  late EquitySharingFormList equitySharingFormList;
  ViewState _viewState = ViewState.Idle;
  bool posting = false;

  ViewState getViewState() => _viewState;
  void setViewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  Future getMemberEquityForms(String memberID) async {
    try {
      setViewState(ViewState.Busy);
      Response response = await _dioService.get().get(
          '''$baseUrl/$GET_equity_sharing_form?fields=["creation","name","sharing_type","member","capital_amount","compounding_tenure","schedule_release_date","approval_status"]''');
      if (response.statusCode == 200) {
        equitySharingFormList = EquitySharingFormList.fromJson(response.data);
      }
      setViewState(ViewState.Idle);
    } catch (e) {
      setViewState(ViewState.Error);
    }
  }

  Future getAllWithdrawRequests(String memberID) async {}

  Future<int?> postWithdrawRequest(String? memberID,
      EquitySharingForm? equitySharingForm, String message) async {
    setViewState(ViewState.Busy);
    try {
      Response postWithdrawRequest = await _dioService
          .get()
          .post('''$baseUrl/resource/Withdraw Request''', data: {
        "member": memberID,
        "equity_sharing_form": equitySharingForm?.name,
        "request_message": message,
        "status": "Open",
        "submission_date": formattedDateForUpload(DateTime.now())
      });

      setViewState(ViewState.Idle);
      return postWithdrawRequest.statusCode;
    } catch (e) {
      setViewState(ViewState.Idle);
      return 400;
    }
  }
}
