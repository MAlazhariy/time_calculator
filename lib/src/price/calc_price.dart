import 'dart:io';

import 'package:calc_hours/time_calculator.dart';
import 'package:intl/intl.dart' show NumberFormat;

/// Calculate price for the working time
void calcPrice() {
  stdout.write('Enter Salary/Hour: ');
  final salary = int.parse(stdin.readLineSync()!);

  print('');
  print('- [Enter] to calc for [$resultTime].');
  print('- Or type a time (hh:mm)');
  final input = stdin.readLineSync()!;
  int h = resultTime.hours;
  int m = resultTime.mins;

  if (input.isNotEmpty) {
    final x = input.split(':');
    h = int.tryParse(x.first) ?? 0;
    m = int.tryParse(x[1]) ?? 0;
  }
  final totalHours = h + (m / 60);

  final result = totalHours * salary;
  print('Price = ${_formatPrice(result)}');
}

String _formatPrice(double price) {
  final f = NumberFormat("###,###.#", "en_US");
  return f.format(price);
}