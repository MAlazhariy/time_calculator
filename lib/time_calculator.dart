
import 'package:calc_hours/src/calc_time/calc_time.dart';
import 'package:calc_hours/src/execute.dart';

/// How to export `exe` file for windows?
// dart compile exe lib/time_calculator.dart

/// How to make file on macOS?
/// 1. `dart compile exe lib/time_calculator.dart -o time_calculator`
/// This generates a native executable (time_calculator) that doesn't require dartaotruntime.
///
/// 2. chmod +x time_calculator
///
/// Now you can directly execute the time_calculator file from the terminal
/// without any additional commands.
/// This is a more robust solution for production use.

// dart compile aot-snapshot lib/time_calculator.dart -o time_calculator.snapshot
// dartaotruntime time_calculator.aot
// https://dart.dev/tools/dartaotruntime



int totalMins = 0;
int totalSeconds = 0;
int hours = 0;
int mins = 0;
int secs = 0;

void main() {
  execute(calcTimes);
}