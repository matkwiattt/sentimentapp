import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sentimentapp/charts/bar_chart.dart';
import 'package:sentimentapp/charts/radial_chart.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double? _deviceHight;
  double? _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _closeButton(),
                ],
              ),
              _resultPageTitle(),
              BarChartSample7(),
              RadialChartSample()
            ]),
          ),
        ),
      ),
    );
  }

  Widget _resultPageTitle() {
    return Text(
      "#BITCOIN",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
    );
  }

  Widget _closeButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
