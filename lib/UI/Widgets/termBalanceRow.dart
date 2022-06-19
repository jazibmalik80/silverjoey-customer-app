import 'package:flutter/material.dart';

class TermBalanceRow extends StatelessWidget {
  const TermBalanceRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '22 Nov 2020',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 0.25,
              ),
            ),
            Text(
              '₱ 13,440',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 0.25,
              ),
            ),
            Text(
              '₱ 13,440',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
