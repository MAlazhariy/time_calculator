import 'package:calc_hours/src/helper/time_calculator_helper.dart';
import 'package:calc_hours/src/models/time_model.dart';
import 'package:calc_hours/time_calculator.dart';

/// Calculate average, then print the result
void calcAvg() {
  final avg = _calcAvgTimePerDay(seconds: totalSeconds, days: days);

  print('~> Avg: [$avg] ($days days)');
}

TimeModel _calcAvgTimePerDay({
  required int seconds,
  required int days,
}) {
  final avgSec = seconds ~/ days;
  return TimeCalculatorHelper.getTimeFromSeconds(avgSec);
}

