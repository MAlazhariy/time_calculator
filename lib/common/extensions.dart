extension TimeString on int {
  String get timePodLeft => '$this'.padLeft(2, '0');
}