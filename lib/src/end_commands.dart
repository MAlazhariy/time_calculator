import 'dart:io';

import 'package:calc_hours/src/calc_time/calc_time.dart';
import 'package:calc_hours/src/price/calc_price.dart';

import 'end_program.dart';

void printEndCommands() {
  print('[\$] Price Calculating');
  print('[c] Calculate other times');
  print('[+] Add other times to current');
  print('[q] Quit');
}

Function? endCommands() {
  print('\n');
  printEndCommands();

  while (true) {
    final input = stdin.readLineSync()!.toLowerCase();
    switch (input) {
      case '\$':
        return calcPrice;
      case 'c':
        return calculateTimes;
      case '+':
        return calcAddTimes;
      case 'q':
        return endProgram;
      case '':
        break;
      default:
        print('Unknown command!');
        printEndCommands();
        break;
    }
  }
}
