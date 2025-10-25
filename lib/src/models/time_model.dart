import 'package:calc_hours/common/extensions.dart';

class TimeModel {
  final int hours;
  final int mins;
  final int? seconds;

  const TimeModel({required this.hours, required this.mins, this.seconds});

  const TimeModel.empty() : this(hours: 0, mins: 0);

  String show({bool hideSeconds = false}) {
    return "${hours.timePodLeft}:${mins.timePodLeft}${seconds != null && seconds != 0 && !hideSeconds ? ":${seconds?.timePodLeft}" : ""}";
  }


  @override
  String toString() => show();
}
