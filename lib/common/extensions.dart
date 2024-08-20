extension TimeString on int {
  String get text => '$this'.padLeft(2, '0');
}