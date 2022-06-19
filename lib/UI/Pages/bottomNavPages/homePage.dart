import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/Pages/compoundingTilePages/compoundingTransactionPage.dart';
import 'package:sj_member_app/UI/Pages/homeCardPages/deposit_Page.dart';
import 'package:sj_member_app/UI/Pages/homeCardPages/inbox_Page.dart';
import 'package:sj_member_app/UI/Pages/homeCardPages/wiki_Page.dart';
import 'package:sj_member_app/UI/Pages/homeCardPages/withdraw_Page.dart';
import 'package:sj_member_app/UI/Pages/investmentTilePages.dart/investmentTransactionPage.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/customAppBar.dart';
import 'package:sj_member_app/UI/Widgets/account_details_widget.dart';
import 'package:sj_member_app/UI/Widgets/customDrawer.dart';
import 'package:sj_member_app/UI/Widgets/customHomeCard.dart';
import 'package:sj_member_app/UI/Widgets/userGreetingWidget.dart';
import 'package:sj_member_app/core/ViewModels/account_details_Viewmodel.dart';
import 'package:sj_member_app/core/ViewModels/authentication_Viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      appBar: CustomAppBar(appBarName: 'Home'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              UserGreeting(
                  username: Provider.of<AuthenticationViewmodel>(context,
                              listen: false)
                          .memberProfileList
                          ?.data
                          .first
                          .firstName ??
                      "Member"),
              SizedBox(height: 25),
              ChangeNotifierProvider<AccountDetailsViewModel>(
                  create: (context) => AccountDetailsViewModel()
                    ..getMemberAccountDetails(
                        Provider.of<AuthenticationViewmodel>(context,
                                    listen: false)
                                .memberProfileList
                                ?.data
                                .first
                                .name ??
                            "This is not being used as of now"),
                  child: AccountDetailsWidget()),
              SizedBox(height: 26),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: CustomHomeCard(
                            icon: Icon(
                              Icons.inbox_outlined,
                              color: primaryColor,
                            ),
                            cardName: 'Inbox',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 12),
                        GestureDetector(
                          child: CustomHomeCard(
                            icon: Icon(
                              Icons.menu_book,
                              color: primaryColor,
                            ),
                            cardName: 'Wiki',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WikiPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // GestureDetector(
                        //   child: CustomHomeCard(
                        //     icon: Icon(
                        //       Icons.credit_card_outlined,
                        //       color: primaryColor,
                        //     ),
                        //     cardName: 'Deposit',
                        //   ),
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => DepositPage(),
                        //       ),
                        //     );
                        //   },
                        // ),
                        // SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            child: CustomHomeCard(
                              icon: Icon(
                                Icons.money,
                                color: primaryColor,
                              ),
                              cardName: 'Submit Withdraw Request',
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WithdrawPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
