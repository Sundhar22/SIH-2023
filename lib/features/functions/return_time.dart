String returnTime(DateTime dateTime) {
  int hourTiming = dateTime.hour;
  int minuteTiming = dateTime.minute;
  return '$hourTiming:$minuteTiming';
}
