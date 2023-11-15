class TimeUtils {
  static String getHour(Duration duration) {
    return duration.inHours > 0 ? '${duration.inHours}:' : '';
  }

  static String getMinute(Duration duration) {
    return duration.inMinutes > 0
        ? '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
        : '';
  }

  static String getSecondDisplay(Duration duration) {
    return duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  }

  static String getTimeDisplayLikeClock(Duration duration) {
    final sDuration =
        "${getHour(duration)}${getMinute(duration)}${getSecondDisplay(duration)}";
    return sDuration;
  }
}
