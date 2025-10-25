import 'package:calc_hours/src/models/time_model.dart';
import 'package:calc_hours/time_calculator.dart';

abstract class TimeCalculatorHelper {
  /// Clear data.
  ///
  /// Use when user want to calculate new time.
  static clearData() {
    resultTime = TimeModel.empty();
    totalSeconds = 0;
    days = 0;
    minTime = TimeModel.empty();
    maxTime = TimeModel.empty();
    times.clear();
  }

  /// Calculate total time from list of times.
  ///
  /// This method does the following:
  /// 1. Calculate total seconds from list of times.
  /// 2. Calculate min & max seconds.
  /// 3. Calculate days.
  /// 4. Calculate & assign the resultTime instance.
  static void calculateTime(List<String> times) {
    int daySeconds = 0;
    int? min;
    int max = 0;

    for (int i = 0; i < times.length; i++) {
      final time = times[i];
      final seconds = _getSeconds(time);
      final isNewDay = _isNewDay(time);

      // Add current seconds to the total seconds.
      totalSeconds += seconds;

      if (isNewDay) {
        // Finalize previous day before starting a new one
        if (i > 0 && daySeconds > 0) {
          if (min == null || daySeconds < min) min = daySeconds;
          if (daySeconds > max) max = daySeconds;
          // print("> Day $days: ${getTimeFromSeconds(daySeconds)}");
        }

        // Increase days
        days++;
        // Set daySeconds to current seconds
        daySeconds = seconds;
      } else {
        // Add seconds to the day seconds.
        daySeconds += seconds;
      }
    }

    // Finalize the last day
    if (daySeconds > 0) {
      if (min == null || daySeconds < min) min = daySeconds;
      if (daySeconds > max) max = daySeconds;
      // print("> Day $days: ${getTimeFromSeconds(daySeconds)}");
    }

    // Set data
    resultTime = getTimeFromSeconds(totalSeconds);
    minTime = getTimeFromSeconds(min ?? 0);
    maxTime = getTimeFromSeconds(max);
  }

  /// If the time String contains **=**, that means it's a new day.
  static bool _isNewDay(String time) {
    return time.contains("=");
  }

  static int _getSeconds(String time) {
    // extract time from string
    final timeModel = extractTime(time);
    return getSecondsFromTimeModel(timeModel);
  }

  /// Extract time from a String like "02:56:00 = some text" or "02:56 = some text" pattern,
  /// so this methods extracts the time from the string in dif patterns.
  ///
  /// Example:
  /// ```dart
  /// final time = extractTime("02:56:00 = some text");
  /// print(time.show()); // 02:56:00
  /// ```
  static TimeModel extractTime(String time) {
    final regex = RegExp(r'(\d{1,2}:\d{1,2}(?:\d{1,2})?)');
    final match = regex.firstMatch(time);
    if (match == null) return TimeModel.empty();

    final hms = match.group(0)!.split(':');
    final hours = int.tryParse(hms[0]) ?? 0;
    final mins = int.tryParse(hms[1]) ?? 0;
    final secs = hms.length > 2 ? int.tryParse(hms[2]) : null;

    return TimeModel(hours: hours, mins: mins, seconds: secs);
  }

  /// Get total seconds from TimeModel.
  ///
  /// ex: 02:56:00 -> 9360 seconds
  static int getSecondsFromTimeModel(TimeModel time) {
    return (time.hours * 60 * 60) + (time.mins * 60) + (time.seconds ?? 0);
  }

  /// Get time model from total seconds.
  ///
  /// Ex: 1540 seconds -> 00:25:40
  static TimeModel getTimeFromSeconds(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final mins = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;
    return TimeModel(hours: hours, mins: mins, seconds: seconds);
  }
}
