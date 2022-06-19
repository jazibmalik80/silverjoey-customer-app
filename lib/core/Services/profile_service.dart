import 'package:dio/dio.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';
import 'package:sj_member_app/core/Models/member_profiles/mem_prof_model.dart';
import 'package:sj_member_app/core/Services/dio_service.dart';
import 'package:sj_member_app/core/Services/endpoints.dart';
import 'package:sj_member_app/locator.dart';

class ProfileService {
  DioService dioService = locator<DioService>();

  Future<MemberProfileList> getMemberInfo(String memberEmail) async {
    Response memberResponse = await dioService.get().get(
        '''$baseUrl/$getMemberProfile&filters=[["frappe_user","=","$memberEmail"]]''');
    // print(memberResponse.data);
    return MemberProfileList.fromJson(memberResponse.data);
  }

  Future<int?> putProfileInfo({
    required String profileID,
    required String profilefirstName,
    required String profilelastName,
    required String profileMiddleName,
    required String profileEmail,
    required String profilePhone,
    required String profileAddress,
  }) async {
    try {
      Response editProfileResponse = await dioService
          .get()
          .patch('''$baseUrl/resource/Member/$profileID''', data: {
        "first_name": "$profilefirstName",
        "last_name": "$profilelastName",
        "middle_name": "$profileMiddleName",
        "frappe_user": "$profileEmail",
        "phone": "$profilePhone",
        "full_name": "$profilefirstName $profileMiddleName $profilelastName",
        "full_address": "$profileAddress",
      });
      return editProfileResponse.statusCode;
    } catch (e) {
      return 400;
    }
  }

  Future<EquitySharingFormList?> getMemberFirstEquity(String memberID) async {
    try {
      Response response = await dioService.get().get(
          '''$baseUrl/$GET_equity_sharing_form?fields=["creation","name","sharing_type","member","capital_amount","compounding_tenure","schedule_release_date","approval_status"]''');
      if (response.statusCode == 200) {
        EquitySharingFormList equitySharingFormList =
            EquitySharingFormList.fromJson(response.data);
        return equitySharingFormList;
      }
    } catch (e) {
      return null;
    }
  }
}
