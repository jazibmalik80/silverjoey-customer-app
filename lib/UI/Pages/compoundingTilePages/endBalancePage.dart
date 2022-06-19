import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/customAppBar.dart';
import 'package:sj_member_app/UI/Widgets/pieChart.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';

class EndBalancePage extends StatelessWidget {
  final EquitySharingForm equitySharingForm;
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  EndBalancePage({Key? key, required this.equitySharingForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarName: 'End Balance'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 12, 24, 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'END OF TERM BALANCE',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              letterSpacing: 1.25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                              '₱ ${oCcy.format((calculateEOTB(equitySharingForm.capitalAmount ?? 10, equitySharingForm.compoundingTenure == "6 Months" ? 6 : 12)))}'),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contribution',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '₱ ${oCcy.format(equitySharingForm.capitalAmount ?? 0.0)}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ROI',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '12%',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expected Release',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${getReleaseDateFromCreation(equitySharingForm.creation, equitySharingForm.compoundingTenure)}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Piechart(
                        equitySharingForm: equitySharingForm,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "MONTHLY BREAKDOWN",
                style: TextStyle(letterSpacing: 1.25, color: Colors.grey),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Month",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Capital",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  Text("Return",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              renderCompoudingList(equitySharingForm.capitalAmount!),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderCompoudingList(
    double capitalAmount,
  ) {
    double capital_amount_copy = capitalAmount;
    if (equitySharingForm.compoundingTenure == "6 Months") {
      List<Widget> sixTiles = [];
      for (int i = 0; i < 6; i++) {
        sixTiles.add(ListTile(
          leading: FlatButton.icon(
            label: Text("${i + 1}"),
            icon: Icon(Icons.calendar_today, color: Color(0xFF029247)),
            onPressed: () {},
          ),
          title: Text("₱ ${oCcy.format(capital_amount_copy)}"),
          trailing: Text("₱ ${oCcy.format(capital_amount_copy * 0.12)}"),
        ));
        capital_amount_copy =
            capital_amount_copy + (capital_amount_copy * 0.12);
      }
      return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: sixTiles,
      );
    } else if (equitySharingForm.compoundingTenure == "12 Months") {
      List<Widget> twelveTiles = [];
      for (int i = 0; i < 12; i++) {
        twelveTiles.add(ListTile(
          leading: FlatButton.icon(
            label: Text("${i + 1}"),
            icon: Icon(Icons.calendar_today, color: Color(0xFF029247)),
            onPressed: () {},
          ),
          title: Text("₱ ${oCcy.format(capital_amount_copy)}"),
          trailing: Text("₱ ${oCcy.format(capital_amount_copy * 0.12)}"),
        ));
        capital_amount_copy =
            capital_amount_copy + (capital_amount_copy * 0.12);
      }
      return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: twelveTiles,
      );
    } else
      return Container();
  }
}
