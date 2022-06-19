import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/Pages/compoundingTilePages/compoundingTransactionPage.dart';
import 'package:sj_member_app/UI/Pages/investmentTilePages.dart/investmentTransactionPage.dart';
import 'package:sj_member_app/UI/Utils/utils.dart';
import 'package:sj_member_app/core/ViewModels/account_details_Viewmodel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';

class AccountDetailsWidget extends StatelessWidget {
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountDetailsViewModel>(
      builder: (context, viewmodel, child) => viewmodel.getViewState() ==
              ViewState.Error
          ? Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "Account details not currently available. Try again later",
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: viewmodel.getViewState() == ViewState.Busy
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ACCOUNT DETAILS',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: ListTile(
                              title: Text('Investment Total'),
                              subtitle: Text(
                                "₱ ${oCcy.format(viewmodel.investmentTotal)}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InvestmentTransactionPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: ListTile(
                              title: Text('Compounding Total'),
                              subtitle: Text(
                                "₱ ${oCcy.format(viewmodel.compoundingTotal)}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CompoundingTransactionPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
            ),
    );
  }
}
