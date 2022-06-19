import 'package:flutter/material.dart';
import 'package:sj_member_app/core/Models/equity_sharing_form/equity_sharing_form.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Piechart extends StatefulWidget {
  final EquitySharingForm equitySharingForm;
  const Piechart({Key? key, required this.equitySharingForm}) : super(key: key);

  @override
  _PiechartState createState() => _PiechartState();
}

class _PiechartState extends State<Piechart> {
  List<SalesData> chartData = [
    SalesData(DateTime(2020, 1, 1), 35),
    SalesData(DateTime(2020, 2, 1), 28),
    SalesData(DateTime(2020, 3, 1), 34),
    SalesData(DateTime(2020, 4, 1), 32),
    SalesData(DateTime(2020, 5, 1), 40)
  ];

  @override
  void initState() {
    super.initState();
    chartData.clear();
    if (widget.equitySharingForm.compoundingTenure == "6 Months") {
      DateTime creationTime = DateTime.parse(
          widget.equitySharingForm.creation ?? DateTime.now().toString());
      double captialAmountCopy = widget.equitySharingForm.capitalAmount ?? 0;
      List<SalesData> sixMonthBreakdown = [];
      for (int i = 0; i < 6; i++) {
        captialAmountCopy = captialAmountCopy + (captialAmountCopy * 0.12);
        sixMonthBreakdown.add(SalesData(
            DateTime(creationTime.year, creationTime.month + i),
            captialAmountCopy));
      }
      chartData = sixMonthBreakdown;
    } else if (widget.equitySharingForm.compoundingTenure == "12 Months") {
      DateTime creationTime = DateTime.parse(
          widget.equitySharingForm.creation ?? DateTime.now().toString());
      double captialAmountCopy = widget.equitySharingForm.capitalAmount ?? 0;
      List<SalesData> twelveMonthBreakdown = [];
      for (int i = 0; i < 12; i++) {
        captialAmountCopy = captialAmountCopy + (captialAmountCopy * 0.12);
        twelveMonthBreakdown.add(
          SalesData(DateTime(creationTime.year, creationTime.month + i),
              captialAmountCopy),
        );
      }
      chartData = twelveMonthBreakdown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: SfCartesianChart(
        primaryXAxis: DateTimeAxis(),
        series: <ChartSeries>[
          LineSeries<SalesData, DateTime>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales)
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
