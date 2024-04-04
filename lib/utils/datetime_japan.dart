import 'package:timezone/timezone.dart' as tz;

class DateTimeJapan {
  // classで定義
  static final tokyoTimeZone = tz.getLocation('Asia/Tokyo');

  static DateTime get yesterday {
    return tz.TZDateTime(
        tokyoTimeZone,
        tz.TZDateTime.now(tokyoTimeZone).year,
        tz.TZDateTime.now(tokyoTimeZone).month,
        tz.TZDateTime.now(tokyoTimeZone).day - 1);
  }

  static DateTime get now {
    return tz.TZDateTime.now(tokyoTimeZone);
  }

  static DateTime dateTime(int year, int month, int day, [int hour = 0]) {
    return tz.TZDateTime(tokyoTimeZone, year, month, day, hour);
  }

  static DateTime fromMillisecondsSinceEpoch(int milliseconds) {
    return tz.TZDateTime.fromMillisecondsSinceEpoch(
        tokyoTimeZone, milliseconds);
  }
}
