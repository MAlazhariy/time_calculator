import 'dart:io';

import 'package:calc_hours/common/extensions.dart';
import 'package:calc_hours/time_calculator.dart';

void calcPrice() {
  stdout.write('Enter Salary/Hour: ');
  final salary = int.parse(stdin.readLineSync()!);

  print('');
  print('- [Enter] to calc for [${hours.text}:${mins.text}].');
  print('- Or type a time as format (hh:mm)');
  final input = stdin.readLineSync()!;
  int h = hours;
  int m = mins;

  if (input.isNotEmpty) {
    final x = input.split(':');
    h = int.tryParse(x.first) ?? 0;
    m = int.tryParse(x[1]) ?? 0;
  }
  final totalHours = h + (m / 60);

  final result = totalHours * salary;
  print('Price = ${result.toStringAsFixed(2)}');
}