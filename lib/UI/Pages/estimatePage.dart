import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/Pages/bottomNavPages/calculatorPage.dart';
import 'package:sj_member_app/UI/Pages/contactSupportPage.dart';

class EstimatePage extends StatefulWidget {
  const EstimatePage({Key? key}) : super(key: key);

  @override
  _EstimatePageState createState() => _EstimatePageState();
}

class _EstimatePageState extends State<EstimatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Estimate',
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 0.15,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone_enabled),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactSupportPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: CalculatorPage(),
    );
  }
}
