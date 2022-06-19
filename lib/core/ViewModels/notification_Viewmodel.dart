import 'package:flutter/widgets.dart';
import 'package:sj_member_app/core/Models/notifications/notification_model.dart';
import 'package:sj_member_app/core/Services/notification_service.dart';
import 'package:sj_member_app/core/enums/viewState.dart';
import 'package:sj_member_app/locator.dart';

class NotificationViewModel extends ChangeNotifier {
  ViewState viewState = ViewState.Idle;
  NotificationList? notificationList;
  NotificationService notificationService = locator<NotificationService>();

  Future fetchNotificationsforMember(String frappeUser) async {
    // "Notification Fetching");
    viewState = ViewState.Busy;
    notifyListeners();
    notificationList =
        await notificationService.getNotificationsforMember(frappeUser);
    viewState = ViewState.Idle;
    notifyListeners();
    // print("Notification Fetched Successfully");
  }
}
