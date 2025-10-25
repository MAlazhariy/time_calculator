
import 'package:calc_hours/src/calc_time/calc_time.dart';
import 'package:calc_hours/src/models/time_model.dart';
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
///
/// see https://dart.dev/tools/dartaotruntime for more.

// dart compile aot-snapshot lib/time_calculator.dart -o time_calculator.snapshot
// dartaotruntime time_calculator.aot


List<String> times = [];
int totalSeconds = 0;
var resultTime = TimeModel.empty();
var minTime = TimeModel.empty();
var maxTime = TimeModel.empty();

// Days
int days = 0;

void main() {
  execute(calculateTimes);
}