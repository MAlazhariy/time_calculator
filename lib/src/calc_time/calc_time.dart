import 'package:calc_hours/src/calc_time/calc_avg.dart';
import 'package:calc_hours/src/calc_time/get_time_multi_lines.dart';
import 'package:calc_hours/src/helper/time_calculator_helper.dart';
import 'package:calc_hours/time_calculator.dart';

void calculateTimes({
  /// Adding times to current
  bool add = false,
  /// Calculate average time
  bool calcAverage = true,
}) {
  if (!add) {
    TimeCalculatorHelper.clearData();
  }

  if (!add) {
    print('Enter times:');
  } else {
    print('Enter times to add to "$resultTime":');
  }

  // Get times from user input
  times = getTimesMultiLinesInput();

  // Calculate equation
  TimeCalculatorHelper.calculateTime(times);

  print('----------');
  print('-> $resultTime | Min ($minTime) & Max ($maxTime)');
  if(calcAverage) calcAvg();
  print('----------');
}

void calcAddTimes() => calculateTimes(add: true);
