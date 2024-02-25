import 'package:flutter/material.dart';

class DataPoint {
  DataPoint({
    required this.label,
    required this.value,
    this.color = Colors.white,
  });
  final String label;
  final double value;
  final Color color;
  static DataPoint jan = DataPoint(label: 'Jan', value: 1500);
  static DataPoint feb = DataPoint(label: 'Feb', value: 2000);
  static DataPoint mar = DataPoint(label: 'Mar', value: 2500);
  static DataPoint apr = DataPoint(label: 'Apr', value: 3000);
  static DataPoint may = DataPoint(label: 'May', value: 560);
  static DataPoint jun = DataPoint(label: 'Jun', value: 4000);
  static DataPoint jul = DataPoint(label: 'Jul', value: 1305);
  static DataPoint aug = DataPoint(label: 'Aug', value: 5000);
  static DataPoint sep = DataPoint(label: 'Sep', value: 5402);
  static DataPoint oct = DataPoint(label: 'Oct', value: 2359);
  static DataPoint nov = DataPoint(label: 'Nov', value: 3253);
  static DataPoint dec = DataPoint(label: 'Dec', value: 6000);

  static List<DataPoint> examples = [
    jan,
    feb,
    mar,
    apr,
    may,
    jun,
    jul,
    aug,
    sep,
    oct,
    nov,
    dec,
  ];
}
