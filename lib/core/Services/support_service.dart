import 'package:dio/dio.dart';

import 'package:sj_member_app/core/Models/services/service_model.dart';
import 'package:sj_member_app/core/Services/dio_service.dart';
import 'package:sj_member_app/core/Services/endpoints.dart';
import 'package:sj_member_app/locator.dart';

class ContactSupportService {
  DioService dioService = locator<DioService>();

  Future<ServiceList> getServices() async {
    Response serviceResponse =
        await dioService.get().get("$baseUrl/$getOfferedServicesurl");
    // print(serviceResponse.data);
    return ServiceList.fromJson(serviceResponse.data);
  }

  Future<int?> postContactUsDetail(
      String contactMessage, String serviceID, String memberID) async {
    try {
      Response contactResponse = await dioService
          .get()
          .post('''$baseUrl/resource/Support Query''', data: {
        "title": "$contactMessage",
        "related_to": "$serviceID",
        "member": memberID,
        "submitted_by": "Member"
      });
      return contactResponse.statusCode;
    } catch (e) {
      return 400;
    }
  }
}
