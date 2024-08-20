import 'dart:io';

import 'package:calc_hours/src/calc_time/calc_time.dart';
import 'package:calc_hours/src/price/calc_price.dart';

void printEndCommands() {
  print('[c] Calculate other times');
  print('[p] Price Calculating');
  print('[a] Add other times to current');
  print('[q] Quit');
}

Function? endCommands() {
  print('\n');
  printEndCommands();

  task:
  while (true) {
    final input = stdin.readLineSync()!.toLowerCase();
    switch (input) {
      case 'c':
        return calcTimes;
      case 'p':
        return calcPrice;
      case 'a':
        return calcAddTimes;
      case 'q':
        break task;
      case '':
        break;
      default:
        print('Unknown command!');
        printEndCommands();
        break;
    }
  }
  return null;
}