import 'package:flutter/material.dart';

class AllTabPage extends StatelessWidget {
  const AllTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 8, 0, 16),
        child: Column(
          children: [
            ListTile(
              title: Text('Investment Plan'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Compounding Plan'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Compounding Plan'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Insurance Plan'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Discount Package'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Investment Plan'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
