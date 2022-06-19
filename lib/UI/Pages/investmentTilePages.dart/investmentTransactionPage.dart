import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/Pages/investmentTilePages.dart/investment_plan_detail_page.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/customAppBar.dart';
import 'package:sj_member_app/UI/Widgets/investmentTransactiontile.dart';
import 'package:sj_member_app/core/ViewModels/investment_list_viewModel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';

class InvestmentTransactionPage extends StatefulWidget {
  const InvestmentTransactionPage({Key? key}) : super(key: key);

  @override
  _InvestmentTransactionPageState createState() =>
      _InvestmentTransactionPageState();
}

class _InvestmentTransactionPageState extends State<InvestmentTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InvestmentListViewModel()
        ..getMemberInvestments("This is not being used"),
      child: Scaffold(
        appBar: CustomAppBar(appBarName: 'Investments'),
        body: Container(
          padding: EdgeInsets.fromLTRB(16, 12, 0, 0),
          child: Consumer<InvestmentListViewModel>(
            builder: (context, viewmodel, child) => viewmodel.getViewState() ==
                    ViewState.Busy
                ? Center(child: CircularProgressIndicator.adaptive())
                : viewmodel.getViewState() == ViewState.Error
                    ? Center(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "Monthly investments list not available. Try again later",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: viewmodel.equitySharingFormList.data.isEmpty
                                ? Center(
                                    child: Text(
                                      "You do not have any \nactive investment services",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                  )
                                : ListView.separated(
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    InvestmentPlanDetail(
                                                  equitySharingForm: viewmodel
                                                      .equitySharingFormList
                                                      .data
                                                      .elementAt(index),
                                                ),
                                              ),
                                            );
                                          },
                                          child: InvestmentTransactionTile(
                                            equitySharingForm: viewmodel
                                                .equitySharingFormList.data
                                                .elementAt(index),
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        Divider(),
                                    itemCount: viewmodel
                                        .equitySharingFormList.data.length),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
