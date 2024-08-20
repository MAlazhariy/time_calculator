import 'dart:io';

List<String> getTimesMultiLines() {
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