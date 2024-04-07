import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static DateTime get nowDate {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime? tryParseFormated(String format, String source) {
    try {
      return DateFormat(format).parse(source);
    } catch (e) {
      return null;
    }
  }

  String toFormatString(String format) {
    return DateFormat(format).format(this);
  }

  bool equalDate(DateTime date) {
    return (year == date.year && month == date.month && day == date.day);
  }

  bool isAfterOrEqualTo(DateTime dateTime) {
    return dateTime.isAtSameMomentAs(this) | isAfter(dateTime);
  }

  bool isBeforeOrEqualTo(DateTime dateTime) {
    return dateTime.isAtSameMomentAs(this) | isBefore(dateTime);
  }

  bool isBetween(
    DateTime fromDateTime,
    DateTime toDateTime,
  ) {
    return isAfterOrEqualTo(fromDateTime) && isBeforeOrEqualTo(toDateTime);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
