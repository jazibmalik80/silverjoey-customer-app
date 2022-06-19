import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';

class CompoundingTransactionCard extends StatelessWidget {
  final EquitySharingForm equitySharingForm;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  CompoundingTransactionCard({
    required this.equitySharingForm,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12, 4, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Expected Release: ${getReleaseDateFromCreation(equitySharingForm.creation, equitySharingForm.compoundingTenure)}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.4,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Term ${equitySharingForm.compoundingTenure}',
                      style: TextStyle(
                        color: Color(0xFF029247),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          Container(
            padding: EdgeInsets.fromLTRB(12, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Capital Investment',
                      style: TextStyle(
                        color: Color(0x99000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(
                        '₱ ${oCcy.format(equitySharingForm.capitalAmount ?? 0.0)}',
                        style: TextStyle(
                          color: Color(0xFF1D1D1D),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          Container(
            padding: EdgeInsets.fromLTRB(12, 0, 8, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EOT Balance',
                      style: TextStyle(
                        color: Color(0x99000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(
                        '₱ ${(oCcy.format(calculateEOTB(equitySharingForm.capitalAmount ?? 10, equitySharingForm.compoundingTenure == "6 Months" ? 6 : 12)))}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.25,
                        ),
                      ),
                      labelPadding: EdgeInsets.fromLTRB(20, 4, 20, 4),
                      backgroundColor: primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
