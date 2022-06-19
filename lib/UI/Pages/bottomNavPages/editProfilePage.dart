import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/simpleAppBar.dart';
import 'package:sj_member_app/core/ViewModels/authentication_Viewmodel.dart';
import 'package:sj_member_app/core/ViewModels/profile_Viewmodel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(appBarName: 'Edit Profile'),
      body: ChangeNotifierProvider<MemberInfoViewModel>(
        create: (context) => MemberInfoViewModel()
          ..getMemberData(
              Provider.of<AuthenticationViewmodel>(context, listen: false)
                      .memberProfileList
                      ?.data
                      .first
                      .frappeUser ??
                  "",
              Provider.of<AuthenticationViewmodel>(context, listen: false)
                      .memberProfileList
                      ?.data
                      .first
                      .name ??
                  ""),
        child: Consumer<MemberInfoViewModel>(
          builder: (context, viewmodel, child) => viewmodel.viewState ==
                  ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Text(
                          'Basic Information',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 24),
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: firstNameController
                                  ..text = viewmodel.memberProfileList!.data
                                      .elementAt(0)
                                      .firstName!,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
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
                                controller: lastNameController
                                  ..text = viewmodel.memberProfileList!.data
                                      .elementAt(0)
                                      .lastName!,
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
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
                                controller: middleNameController
                                  ..text = viewmodel.memberProfileList!.data
                                          .elementAt(0)
                                          .middleName ??
                                      "",
                                decoration: InputDecoration(
                                  labelText: 'Middle Name',
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
                                  ..text = viewmodel.memberProfileList!.data
                                      .elementAt(0)
                                      .frappeUser!,
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
                                controller: phoneController
                                  ..text = viewmodel.memberProfileList!.data
                                      .elementAt(0)
                                      .phone!,
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
                                controller: addressController
                                  ..text = viewmodel.memberProfileList!.data
                                      .elementAt(0)
                                      .fullAddress!,
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
                              SizedBox(height: 24),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFF029247)),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.fromLTRB(30, 15, 30, 15)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(23.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'UPDATE',
                                  style: overlayStyle,
                                ),
                                onPressed: () async {
                                  await viewmodel.updateProfileInfo(
                                    profileID:
                                        Provider.of<AuthenticationViewmodel>(
                                                    context,
                                                    listen: false)
                                                .memberProfileList
                                                ?.data
                                                .first
                                                .name ??
                                            "",
                                    profilefirstName: firstNameController.text,
                                    profilelastName: lastNameController.text,
                                    profileMiddleName:
                                        middleNameController.text,
                                    profileEmail: emailController.text,
                                    profilePhone: phoneController.text,
                                    profileAddress: addressController.text,
                                  );

                                  final snackBar =
                                      SnackBar(content: Text('✔ Info Updated'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
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
