import 'package:intl/intl.dart';

class TimeUtils {
  static String getHour(Duration duration) {
    return duration.inHours > 0 ? '${duration.inHours}:' : '';
  }

  static String getMinute(Duration duration) {
    return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:';
  }

  static String getSecondDisplay(Duration duration) {
    return duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  }

  static String getTimeDisplayLikeClock(Duration duration) {
    final sDuration =
        "${getHour(duration)}${getMinute(duration)}${getSecondDisplay(duration)}";
    return sDuration;
  }

  static String getTimeFormatFromTimeStamp(int timeStamp) {
    var date = DateTime.fromMicrosecondsSinceEpoch(timeStamp);
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(date);
    return formattedDate;
  }

  static String geDDMMYYYYFromTimeStamp(int timeStamp) {
    var date = DateTime.fromMicrosecondsSinceEpoch(timeStamp);
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    return formattedDate;
  }

  static String getTimeClockTraining(int timeStamp) {
    var date = DateTime.fromMicrosecondsSinceEpoch(timeStamp);
    String formattedDate = DateFormat('kk:mm').format(date);
    return formattedDate;
  }
}
