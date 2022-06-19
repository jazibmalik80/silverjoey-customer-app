import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/customAppBar.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  late int selectedRadio;

  @override
  void initState() {
    selectedRadio = 0;
    super.initState();
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarName: 'Deposit'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: primaryColor,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                  ),
                  Text('Investment'),
                  SizedBox(width: 20),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      setSelectedRadio(value);
                    },
                  ),
                  Text('Compounding'),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Select Plan',
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black87,
                    ),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Select Amount',
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  suffixIcon: Icon(
                    Icons.credit_card_outlined,
                    color: Colors.black87,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 15),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF029247)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.fromLTRB(50, 15, 50, 15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.0),
                    ),
                  ),
                ),
                child: Text(
                  'PAY',
                  style: overlayStyle,
                ),
                onPressed: () {
                  final snackBar = SnackBar(content: Text('✔ Submitted'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
