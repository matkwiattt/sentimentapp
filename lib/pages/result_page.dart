import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math' as math;

class ResultPage extends StatefulWidget {
  final String data;
  final String? searchQuery;
  ResultPage({Key? key, required this.data, required this.searchQuery})
      : super(key: key);
  final shadowColor = const Color(0xFFCCCCCC);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: widget.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

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
              _barChart(),
              _radialChart()
            ]),
          ),
        ),
      ),
    );
  }

  Widget _resultPageTitle() {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String searchQuery = arguments['searchQuery'] as String;
    return Text(
      searchQuery,
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

  //charts
  Widget _radialChart() {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final double negative = double.parse(arguments['data']['Negative']);
    final double positive = double.parse(arguments['data']['Positive']);
    final double score = ((positive - negative) / (positive + negative));

    return Center(
        child: Container(
            child: SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          minimum: -1,
          maximum: 1,
          useRangeColorForAxis: true,
          ranges: <GaugeRange>[
            GaugeRange(startValue: -1, endValue: -0.5, color: Colors.red),
            GaugeRange(startValue: -0.5, endValue: 0.5, color: Colors.orange),
            GaugeRange(startValue: 0.5, endValue: 1, color: Colors.green)
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: score,
              needleColor: Colors.white,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text((score * 100).toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                angle: 90,
                positionFactor: 0.5)
          ])
    ])));
  }

  Widget _barChart() {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final double negative = double.parse(arguments['data']['Negative']);
    final double neutral = double.parse(arguments['data']['Neutral']);
    final double positive = double.parse(arguments['data']['Positive']);
    final dataList = [
      _BarData(Colors.red, negative * 100, 0),
      _BarData(Colors.orange, neutral * 100, 0),
      _BarData(Colors.green, positive * 100, 0),
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        height: _deviceHight! * 0.5,
        width: 400,
        child: AspectRatio(
          aspectRatio: 1.4,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              borderData: FlBorderData(
                show: true,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                  drawBehindEverything: true,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 36,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: _IconWidget(
                          color: dataList[index].color,
                          isSelected: touchedGroupIndex == index,
                        ),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(),
                topTitles: AxisTitles(),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.white.withOpacity(0.2),
                  strokeWidth: 1,
                ),
              ),
              barGroups: dataList.asMap().entries.map((e) {
                final index = e.key;
                final data = e.value;
                return generateBarGroup(
                  index,
                  data.color,
                  data.value,
                  data.shadowValue,
                );
              }).toList(),
              maxY: 100,
              barTouchData: BarTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipMargin: 0,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.toY.toString(),
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        color: rod.color,
                        fontSize: 18,
                        shadows: const [
                          Shadow(
                            color: Colors.white,
                            blurRadius: 12,
                          )
                        ],
                      ),
                    );
                  },
                ),
                touchCallback: (event, response) {
                  if (event.isInterestedForInteractions &&
                      response != null &&
                      response.spot != null) {
                    setState(() {
                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                    });
                  } else {
                    setState(() {
                      touchedGroupIndex = -1;
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BarData {
  const _BarData(this.color, this.value, this.shadowValue);
  final Color color;
  final double value;
  final double shadowValue;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}
