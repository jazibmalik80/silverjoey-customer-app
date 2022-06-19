import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/core/ViewModels/authentication_Viewmodel.dart';
import 'package:sj_member_app/core/ViewModels/notification_Viewmodel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';
import 'package:flutter_html/flutter_html.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ChangeNotifierProvider<NotificationViewModel>(
        create: (context) => NotificationViewModel()
          ..fetchNotificationsforMember(
              Provider.of<AuthenticationViewmodel>(context, listen: false)
                      .memberProfileList
                      ?.data
                      .first
                      .frappeUser ??
                  ""),
        child: Consumer<NotificationViewModel>(
            builder: (context, viewmodel, child) {
          if (viewmodel.viewState == ViewState.Busy)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Container(
              padding: EdgeInsets.fromLTRB(14, 8, 0, 16),
              child: viewmodel.notificationList!.data.isEmpty
                  ? Center(
                      child: Text(
                        "You do not have any new notifications.",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.separated(
                      itemCount: viewmodel.notificationList!.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            viewmodel.notificationList!.data
                                .elementAt(index)
                                .subject,
                          ),
                          subtitle: Html(
                            data: viewmodel.notificationList!.data
                                    .elementAt(index)
                                    .emailContent +
                                '\n' +
                                DateFormat.yMMMd('en_US').format(
                                  DateTime.parse(viewmodel
                                      .notificationList!.data
                                      .elementAt(index)
                                      .creation),
                                ) +
                                '   ' +
                                DateFormat.jm().format(
                                  DateTime.parse(viewmodel
                                      .notificationList!.data
                                      .elementAt(index)
                                      .creation),
                                ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(thickness: 1),
                    ),
            );
        }),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/Pages/notificationPages/allTabPage.dart';
import 'package:sj_member_app/UI/Pages/notificationPages/newsTabPage.dart';
import 'package:sj_member_app/UI/Pages/notificationPages/planTabPage.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/customAppBar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarName: 'Notifications'),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(text: 'ALL'),
                  Tab(text: 'PLAN'),
                  Tab(text: 'NEWS'),
                ],
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: TabBarView(
                  children: [
                    AllTabPage(),
                    PlanTabPage(),
                    NewsTabPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
