// @dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/mainAppBar.dart';
import 'package:sj_member_app/core/ViewModels/authentication_Viewmodel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';
import 'package:sj_member_app/core/ViewModels/profile_Viewmodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarName: 'Profile'),
      body: ChangeNotifierProvider<MemberInfoViewModel>(
        create: (context) => MemberInfoViewModel()
          ..getMemberData(
              Provider.of<AuthenticationViewmodel>(context, listen: false)
                  .memberProfileList
                  .data
                  .first
                  .frappeUser,
              Provider.of<AuthenticationViewmodel>(context, listen: false)
                  .memberProfileList
                  .data
                  .first
                  .name),
        child: Consumer<MemberInfoViewModel>(
          builder: (context, viewmodel, child) =>
              viewmodel.viewState == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: primaryColor,
                                  child: Image(
                                    image: AssetImage(
                                      "Assets/AFMS_Logo.png",
                                    ),
                                  ),
                                ),
                                SizedBox(width: 24),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewmodel.memberProfileList.data
                                          .elementAt(0)
                                          .getFullname(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "First Investment: ${viewmodel.equitySharingFormList != null && viewmodel.equitySharingFormList.data.isNotEmpty ? formattedDateTime(viewmodel.equitySharingFormList.data.last.creation) : "Date not available"}",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                // IconButton(
                                //   icon: Icon(
                                //     Icons.edit,
                                //   ),
                                //   color: primaryColor,
                                //   onPressed: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => EditProfilePage(),
                                //       ),
                                //     );
                                //   },
                                // ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(thickness: 1),
                            SizedBox(height: 16),
                            Text(
                              'Basic Information',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 16),
                            Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    enabled: false,
                                    controller: nameController
                                      ..text = viewmodel.memberProfileList.data
                                              .elementAt(0)
                                              .firstName +
                                          ' ' +
                                          viewmodel.memberProfileList.data
                                              .elementAt(0)
                                              .lastName,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 15, 15, 15),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextFormField(
                                    enabled: false,
                                    controller: emailController
                                      ..text = viewmodel.memberProfileList.data
                                          .elementAt(0)
                                          .frappeUser,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 15, 15, 15),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextFormField(
                                    enabled: false,
                                    controller: phoneController
                                      ..text = viewmodel.memberProfileList.data
                                          .elementAt(0)
                                          .phone,
                                    decoration: InputDecoration(
                                      labelText: 'Phone',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 15, 15, 15),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextFormField(
                                    enabled: false,
                                    controller: addressController
                                      ..text = viewmodel.memberProfileList.data
                                          .elementAt(0)
                                          .fullAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Address',
                                      labelStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 15, 15, 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
