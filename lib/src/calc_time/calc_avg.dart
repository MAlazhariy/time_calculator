import 'package:calc_hours/common/extensions.dart';
import 'package:calc_hours/time_calculator.dart';

import 'calc_time.dart';

void calcAvg() {
  final timeCount = times.length;
  final avg = _calcAvgTimePerDay(seconds: totalSeconds, timeCount: timeCount);

  print('-> Avg: "$avg" for ($timeCount inputs)');
}

String _calcAvgTimePerDay({
  required int seconds,
  required int timeCount,
}) {
  final avgSec = seconds ~/ timeCount;
  final avgHours = calcHours(avgSec);
  final avgMins = calcMins(avgSec);
  return '${avgHours.text}:${avgMins.text}';
}

