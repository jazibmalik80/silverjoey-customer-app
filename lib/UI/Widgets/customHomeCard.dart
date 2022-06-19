import 'package:flutter/material.dart';

class CustomHomeCard extends StatelessWidget {
  final Icon icon;
  final String cardName;

  const CustomHomeCard({
    required this.icon,
    required this.cardName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Color(0x33000000),
      child: Container(
        width: 130,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 5),
            Text('$cardName'),
          ],
        ),
      ),
    );
  }
}
