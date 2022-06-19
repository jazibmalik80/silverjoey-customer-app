import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/Pages/compoundingTilePages/endBalancePage.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/customAppBar.dart';
import 'package:sj_member_app/UI/Widgets/compoundingTransactionCard.dart';
import 'package:sj_member_app/core/ViewModels/compound_list_viewModel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';

class CompoundingTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompoundListViewModel()
        ..getMemberCompounding("This is not being used"),
      child: Scaffold(
        appBar: CustomAppBar(appBarName: 'Compoundings'),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Consumer<CompoundListViewModel>(
            builder: (context, viewmodel, child) => viewmodel.getViewState() ==
                    ViewState.Busy
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: viewmodel.equitySharingFormList.data.isEmpty
                            ? Center(
                                child: Text(
                                  "You do not have any \nactive compounding services",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              )
                            : ListView.builder(
                                itemCount:
                                    viewmodel.equitySharingFormList.data.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EndBalancePage(
                                          equitySharingForm: viewmodel
                                              .equitySharingFormList.data
                                              .elementAt(index),
                                        ),
                                      ),
                                    );
                                  },
                                  child: CompoundingTransactionCard(
                                    equitySharingForm: viewmodel
                                        .equitySharingFormList.data
                                        .elementAt(index),
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
