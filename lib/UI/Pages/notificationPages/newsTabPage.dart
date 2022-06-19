import 'package:flutter/material.dart';

class NewsTabPage extends StatelessWidget {
  const NewsTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 8, 0, 16),
        child: Column(
          children: [
            ListTile(
              title: Text('Plan Update'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Discount Update'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('News Investment Plan'),
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
