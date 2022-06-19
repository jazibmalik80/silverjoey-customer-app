import 'package:dio/dio.dart';
import 'package:sj_member_app/core/Models/notifications/notification_model.dart';
import 'package:sj_member_app/core/Services/dio_service.dart';
import 'package:sj_member_app/core/Services/endpoints.dart';
import 'package:sj_member_app/locator.dart';

class NotificationService {
  DioService dioService = locator<DioService>();

  Future<NotificationList> getNotificationsforMember(String frappeUser) async {
    Response notificationsResponse = await dioService.get().get(
        '''$baseUrl/$GET_notifications&filters=[["for_user","=","$frappeUser}"]]''');
    // print(notificationsResponse.statusCode);
    return NotificationList.fromJson(notificationsResponse.data);
  }
}
