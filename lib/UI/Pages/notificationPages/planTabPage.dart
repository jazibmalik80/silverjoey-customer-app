import 'package:flutter/material.dart';

class PlanTabPage extends StatelessWidget {
  const PlanTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 8, 0, 16),
        child: Column(
          children: [
            ListTile(
              title: Text('New Payment Cycle'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Policy Updated'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('T&C Revised'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Payment Cycle Completed'),
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
