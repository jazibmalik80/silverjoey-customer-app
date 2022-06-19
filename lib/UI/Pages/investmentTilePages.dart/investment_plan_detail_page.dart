import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';

import '../contactSupportPage.dart';

class InvestmentPlanDetail extends StatelessWidget {
  final EquitySharingForm equitySharingForm;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  InvestmentPlanDetail({Key? key, required this.equitySharingForm})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.bookmark_outline,
          color: Colors.white,
        ),
        label: Text(
          'Contact Support',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactSupportPage(),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Plan Details"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PLAN TYPE',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Monthly Return Investment',
                      style: TextStyle(
                        color: Color(0xBD000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CYCLE LENGTH',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1 month',
                      style: TextStyle(
                        color: Color(0xBD000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CAPITAL AMOUNT',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '₱ ${oCcy.format(equitySharingForm.capitalAmount)}',
                      style: TextStyle(
                        color: Color(0xBD000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EXPECTED RETURN',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "₱ ${oCcy.format(equitySharingForm.capitalAmount! * 0.12)}",
                      style: TextStyle(
                        color: Color(0xBD000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SCHEDULED DATE OF RELEASE ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 4),
                Chip(
                  label: Text(
                    getNextPaymentDate(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RETURN ON INVESTMENT',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '12% of Capital',
                      style: TextStyle(
                        color: Color(0xBD000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WHEN THIS INVESTMENT STARTED',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      formattedDateTime(equitySharingForm.creation!),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'TO',
                //       style: TextStyle(
                //         color: Color(0xDE000000),
                //         fontSize: 10,
                //         fontWeight: FontWeight.w500,
                //         letterSpacing: 1.5,
                //       ),
                //     ),
                //     Chip(
                //       label: Text(
                //         '1 Jul 2020, 09:25 PM',
                //         style: TextStyle(
                //           color: Colors.orange,
                //           fontSize: 12,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              child: Text(
                'This investment option has a gestation period of 30 to 45 days. Profits are released on a scheduled date (every 15th or 30th of every month). Current market share will be 12% based on the capital. 20,000 Php minimum investment with a one-time fee of 500 Php.',
                style: TextStyle(
                  color: Color(0xBD000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formattedDateForInvestmentReturn(String rawDate) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var date1 = inputFormat.parse(rawDate);
    var outputFormat = DateFormat('dd MMM yy');
    return outputFormat.format(date1);
  }

  String getNextPaymentDate() {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime creationDate = inputFormat.parse(equitySharingForm.creation!);
    DateTime today = DateTime.now();
    DateTime nextPaymentDateOne =
        DateTime(today.year, creationDate.month + 1, 15);
    DateTime nextPaymentDateTwo =
        DateTime(today.year, creationDate.month + 1, 30);
    return "${DateFormat('dd MMM yy').format(nextPaymentDateOne)} or ${DateFormat('dd MMM yy').format(nextPaymentDateTwo)}";
  }
}
