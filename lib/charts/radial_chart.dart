import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialChartSample extends StatefulWidget {
  const RadialChartSample({super.key});

  @override
  State<RadialChartSample> createState() => _RadialChartSampleState();
}

class _RadialChartSampleState extends State<RadialChartSample> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          minimum: 0,
          maximum: 100,
          useRangeColorForAxis: true,
          ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 30, color: Colors.green),
            GaugeRange(startValue: 30, endValue: 70, color: Colors.orange),
            GaugeRange(startValue: 70, endValue: 100, color: Colors.red)
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: 90,
              needleColor: Colors.white,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('90.0',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                angle: 90,
                positionFactor: 0.5)
          ])
    ])));
  }
}
