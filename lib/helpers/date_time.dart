import 'package:date_format/date_format.dart';

abstract class DateTimeHelper {
  static String getFormattedToday() {
    return formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy]);
  }

  static DateTime parseFormattedDateString(String formattedDate) {
    List<String> date = formattedDate.split('/');
    return DateTime.utc(
        int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
  }
}
