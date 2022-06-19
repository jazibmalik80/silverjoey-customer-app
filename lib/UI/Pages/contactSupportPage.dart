import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/simpleAppBar.dart';
import 'package:sj_member_app/core/Models/services/service_model.dart';
import 'package:sj_member_app/core/ViewModels/authentication_Viewmodel.dart';

import 'package:sj_member_app/core/ViewModels/contactUs_ViewModel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';

class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({Key? key}) : super(key: key);

  @override
  _ContactSupportPageState createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  ServiceData? valueChoose;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactUsViewModel()..fetchOfferedServices(),
      child: Scaffold(
        appBar: SimpleAppBar(appBarName: 'Contact Support'),
        body: SingleChildScrollView(
          child: Consumer<ContactUsViewModel>(
            builder: (context, viewmodel, child) => viewmodel.viewState ==
                    ViewState.Busy
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 16),
                        Form(
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              DropdownButton<ServiceData>(
                                isExpanded: true,
                                hint: Text('Select Service'),
                                items:
                                    viewmodel.serviceList!.data.map((element) {
                                  return DropdownMenuItem<ServiceData>(
                                    child: Text(element.title),
                                    value: element,
                                  );
                                }).toList(),
                                value: valueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                  });
                                  //print(valueChoose!
                                  //   .roiPercentageOnCapitalInvestment);
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: messageController,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  labelText: 'Message',
                                  labelStyle: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                  hintText: 'Enter your message here',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                                maxLines: 10,
                              ),
                              SizedBox(height: 25.0),
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
                                  'SEND MESSAGE',
                                  style: overlayStyle,
                                ),
                                onPressed: () async {
                                  if (messageController.text.isNotEmpty &&
                                      valueChoose != null) {
                                    await viewmodel.addContactUsDetail(
                                        messageController.text,
                                        valueChoose!.name,
                                        Provider.of<AuthenticationViewmodel>(
                                                    context,
                                                    listen: false)
                                                .memberProfileList
                                                ?.data
                                                .first
                                                .name ??
                                            "");
                                    final snackBar = SnackBar(
                                        content: Text('✔ Message Sent'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Please pick a service and provide a message'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
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
