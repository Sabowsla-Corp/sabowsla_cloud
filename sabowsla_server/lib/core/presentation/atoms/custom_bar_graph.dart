// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/data_point.dart';
import 'package:sabowsla_cloud/core/styles.dart';

class CustomBarGraph extends StatelessWidget {
  const CustomBarGraph({
    this.graphTitle = 'Graph Title',
    super.key,
    this.points = const [],
    this.height = 300,
    this.barWidth = 40,
  });
  final List<DataPoint> points;
  final double height;
  final double barWidth;
  final String graphTitle;

  Widget barsBuilder() {
    var widgets = <Widget>[];

    var largest = points[0];
    var smallest = points[0];

    points.forEach(
      (gfg) {
        if (gfg.value > largest.value) {
          largest = gfg;
        }
        if (gfg.value < smallest.value) {
          smallest = gfg;
        }
      },
    );
    for (var point in points) {
      double h = (point.value / largest.value) * height;
      widgets.add(
        barBuilder(
          height: h,
          color: point.color,
          label: point.label,
        ),
      );
      widgets.add(const SizedBox(width: 5));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: widgets,
    );
  }

  Widget barBuilder({
    required double height,
    required Color color,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          height: height,
          width: barWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            graphTitle,
            style: styles24.whiteBold,
          ),
          Row(
            children: [
              unitsBuilder(),
              const SizedBox(height: 10),
              barsBuilder(),
            ],
          ),
        ],
      ),
    );
  }

  Widget unitsBuilder() {
    var largest = points[0];
    var smallest = points[0];

    points.forEach(
      (gfg) {
        if (gfg.value > largest.value) {
          largest = gfg;
        }
        if (gfg.value < smallest.value) {
          smallest = gfg;
        }
      },
    );
    int divisions = 5;
    List<int> units = [];
    for (var i = 0; i <= divisions; i++) {
      units.add(((largest.value) / divisions * i).toInt());
    }
    return Container(
      height: height,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        verticalDirection: VerticalDirection.up,
        children: [
          ...units.map(
            (e) => Text(
              e.toString(),
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
