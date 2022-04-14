import 'package:app_reports_flutter/outrapagina.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bar_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<BarChartModel> data = [
    BarChartModel(
      year: '2022',
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      year: '2019',
      financial: 200,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 24, 129, 182)),
    ),
    BarChartModel(
      year: '2018',
      financial: 230,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 16, 179, 143)),
    ),
    BarChartModel(
      year: '2017',
      financial: 234,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 80, 18, 180)),
    ),
    BarChartModel(
      year: '2016',
      financial: 222,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 193, 19, 216)),
    ),
    BarChartModel(
      year: '2016',
      financial: 190,
      color: charts.ColorUtil.fromDartColor(
          const Color.fromARGB(255, 224, 186, 14)),
    ),
  ];

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: const Text("Bar Chart Flutter")),
        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Container(
          margin: const EdgeInsets.only(top: 200),
          height: 400,
          padding: const EdgeInsets.all(10),
          child: charts.BarChart(
            series,
            animate: true,
          ),
        )

        //floatingActionButton: FloatingActionButton(
        //    child: const Icon(Icons.add), onPressed: c.increment),
        );
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}
