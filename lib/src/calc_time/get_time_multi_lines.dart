import 'dart:io';

List<String> getTimesMultiLinesInput() {
  List<String> times = [];
  while (true) {
    final time = stdin.readLineSync()!;
    if (time.isEmpty) {
      break;
    }
    times.add(time);
  }
  return times;
}