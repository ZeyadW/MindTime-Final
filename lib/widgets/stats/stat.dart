import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medico/models/statdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _PieData {
  var countv;

  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  int yData;
  final String text;
}

class Stat extends StatefulWidget {
  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
  var countv;
  var countj;
  Future<void> count() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.countv = prefs.getInt('countV');
    print('count');
    print(countv);
  }

  @override
  void initState() {
    count();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<_PieData> pieData = [
      _PieData('Text', 35, 'Text'),
<<<<<<< HEAD
      _PieData('Video', 20, 'Video'),
=======
      _PieData('Video', 25, 'Video'),
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
      _PieData('Audio', 34, 'Audio'),
    ];

    return Center(
      child: Column(children: [
        //Initialize the chart widget
        SfCircularChart(
            borderColor: Colors.transparent,
            backgroundColor: Colors.white,
            palette: [Colors.blue[200], Colors.blue[400], Colors.blue[600]],
            tooltipBehavior: TooltipBehavior(
              enable: true,
            ),
<<<<<<< HEAD
            title: ChartTitle(text: 'Data count for each Data type'),
=======
            title: ChartTitle(text: 'Data count for each type of Diaries'),
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
            legend: Legend(isVisible: true),
            series: <RadialBarSeries<_PieData, String>>[
              RadialBarSeries<_PieData, String>(
                  dataSource: pieData,
                  xValueMapper: (_PieData data, _) => data.xData,
                  yValueMapper: (_PieData data, _) => data.yData,
                  dataLabelMapper: (_PieData data, _) => data.text,
                  dataLabelSettings: DataLabelSettings(isVisible: true)),
            ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          //Initialize the spark charts widget
          child: SfSparkLineChart.custom(
            axisLineColor: Colors.blue[900],
            //Enable the trackball
            trackball: SparkChartTrackball(
                activationMode: SparkChartActivationMode.tap),
            //Enable marker
            marker: SparkChartMarker(
                displayMode: SparkChartMarkerDisplayMode.all,
                borderColor: Colors.black),
            //Enable data label
            labelDisplayMode: SparkChartLabelDisplayMode.all,
            xValueMapper: (int index) => pieData[index].xData,
            yValueMapper: (int index) => pieData[index].yData,
            dataCount: 3,
          ),
        )
      ]),
    );
  }
}
