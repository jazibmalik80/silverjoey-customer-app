import 'package:dio/dio.dart';

import 'package:sj_member_app/core/Models/services/service_model.dart';
import 'package:sj_member_app/core/Services/dio_service.dart';
import 'package:sj_member_app/core/Services/endpoints.dart';
import 'package:sj_member_app/locator.dart';

class CalculatorService {
  DioService dioService = locator<DioService>();

  Future<ServiceList> getOfferedServices() async {
    Response serviceResponse =
        await dioService.get().get("$baseUrl/$getOfferedServicesurl");
    // print(serviceResponse.data);
    return ServiceList.fromJson(serviceResponse.data);
  }
}
