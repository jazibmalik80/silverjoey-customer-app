import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/customAppBar.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';
import 'package:sj_member_app/core/ViewModels/authentication_Viewmodel.dart';
import 'package:sj_member_app/core/ViewModels/withdraw_viewmodel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  EquitySharingForm? equitySharingForm;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WithdrawViewModel()
        ..getMemberEquityForms(
            "Frappe implements user permissions so we're not using this as of now"),
      child: Consumer<WithdrawViewModel>(
        builder: (context, viewmodel, child) => Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              if (textEditingController.text.isNotEmpty &&
                  equitySharingForm != null) {
                int? postStatus = await viewmodel.postWithdrawRequest(
                    Provider.of<AuthenticationViewmodel>(context, listen: false)
                        .memberProfileList!
                        .data
                        .elementAt(0)
                        .name,
                    equitySharingForm,
                    textEditingController.text);
                if (postStatus == 200) {
                  final snackBar = SnackBar(content: Text('✔️ Submitted'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  textEditingController.clear();
                  equitySharingForm = null;
                  viewmodel.setViewState(ViewState.Idle);
                } else {
                  final snackBar = SnackBar(
                      content: Text('Something went wrong. Try again later'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else {
                final snackBar = SnackBar(
                    content: Text(
                        'You need to select a plan and type your request before submission for withdraw.'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            label: Text(
              'SUBMIT REQUEST',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          appBar: CustomAppBar(appBarName: 'Withdraw'),
          body: viewmodel.getViewState() == ViewState.Busy
              ? Center(child: CircularProgressIndicator.adaptive())
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Text(
                          "SELECT YOUR PLAN",
                          style: TextStyle(
                              color: Colors.grey, letterSpacing: 1.25),
                        ),
                        DropdownButton<EquitySharingForm>(
                          isExpanded: true,
                          hint: Text('Select Plan'),
                          items: viewmodel.equitySharingFormList.data
                              .map((element) {
                            return DropdownMenuItem<EquitySharingForm>(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      "${element.sharingType} (₱ ${element.capitalAmount})"),
                                ],
                              ),
                              value: element,
                            );
                          }).toList(),
                          value: equitySharingForm,
                          onChanged: (newValue) {
                            setState(() {
                              equitySharingForm = newValue;
                            });
                          },
                        ),
                        SizedBox(height: 24),
                        Text(
                          "ENTER YOUR REQUEST",
                          style: TextStyle(
                              color: Colors.grey, letterSpacing: 1.25),
                        ),
                        SizedBox(height: 12),
                        TextField(
                          controller: textEditingController,
                          maxLines: 10,
                          decoration: InputDecoration(
                            labelText: 'Message',
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
                            contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
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
