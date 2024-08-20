import 'package:calc_hours/src/end_commands.dart';

void execute(Function? function) {
  if (function == null) return;

  try {
    function.call();
  } catch (e) {
    print('❌ ERROR OCCURRED!');
    print('$e');
    print('');
  }

  final func = endCommands();
  if (func != null) {
    return execute(func);
  }
}