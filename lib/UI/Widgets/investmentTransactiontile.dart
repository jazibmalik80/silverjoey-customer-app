import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sj_member_app/UI/Utils/utils.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';

class InvestmentTransactionTile extends StatelessWidget {
  final EquitySharingForm equitySharingForm;

  InvestmentTransactionTile({required this.equitySharingForm});
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 4, 14, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monthly Investment Plan',
                style: TextStyle(
                  color: Color(0x99000000),
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 2),
              Text(
                '₱ ${oCcy.format(equitySharingForm.capitalAmount)}',
                style: TextStyle(
                  color: Color(0xDE000000),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 2),
              Text(
                formattedDateTime(
                    equitySharingForm.creation ?? DateTime.now().toString()),
                style: TextStyle(
                  color: Color(0xFF029247),
                  fontSize: 14,
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
                  color: Color(0x99000000),
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 2),
              Text(
                '₱ ${oCcy.format(equitySharingForm.capitalAmount! * 0.12)}',
                style: TextStyle(
                  color: Color(0xDE000000),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 2),
              Text(
                formattedDateOnly(
                    equitySharingForm.scheduleReleaseDate ?? "2020-10-10"),
                style: TextStyle(
                  color: Color(0xFFFF3D00),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
