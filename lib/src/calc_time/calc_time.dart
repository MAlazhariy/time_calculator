import 'package:calc_hours/common/extensions.dart';
import 'package:calc_hours/src/calc_time/get_time_multi_lines.dart';
import 'package:calc_hours/time_calculator.dart';

void calcTimes([bool add = false]) {
  if (!add) {
    totalMins = 0;
    totalSeconds = 0;
    hours = 0;
    mins = 0;
    secs = 0;
  }

  if (!add) {
    print('Enter times:');
  } else {
    print('Enter times to add to "${hours.text}:${mins.text}:${secs.text}":');
  }
  final times = getTimesMultiLines();

  // Calculate equation
  if (!add) {
    totalSeconds = calculateTotalSecs(times);
  } else {
    totalSeconds += calculateTotalSecs(times);
  }
  totalMins = calculateTotalMins(totalSeconds);
  hours = calcHours(totalSeconds);
  mins = calcMins(totalSeconds);
  secs = calcSeconds(totalSeconds);

  print('----------');
  print('-> $totalMins minutes');
  print('-> ${hours.text}:${mins.text}:${secs.text}');
  print('----------');
}

void calcAddTimes() => calcTimes(true);

int calculateTotalSecs(List<String> times) {
  int totalSecs = 0;

  for (var time in times) {
    final hms = time.split(':');
    final hour = int.parse(hms[0]);
    final min = int.parse(hms[1]);
    final sec = getSeconds(hms) ?? 0;
    final calc = hour * 60 * 60 + min * 60 + sec;
    // print('- min: $min - sec: $sec | calc: $calc');

    totalSecs += calc;
  }
  return totalSecs;
}

int calculateTotalMins(int totalSeconds) => totalSeconds ~/ 60;

int calcHours(int totalSeconds) => totalSeconds ~/ 3600;

int calcMins(int totalSeconds) => totalSeconds % 3600 ~/ 60;

int calcSeconds(int totalSeconds) => totalSeconds % 60;

int? getSeconds(List<String> times) {
  if (times.length > 2) {
    return int.tryParse(times[2]);
  }
  return null;
}
