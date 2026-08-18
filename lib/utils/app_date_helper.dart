import 'package:shamsi_date/shamsi_date.dart';
import '../models/calendar_type.dart';

class AppDateHelper {
  static CalendarType currentType = CalendarType.jalali;

  static String formatDate(DateTime date, {String pattern = 'yyyy/MM/dd'}) {
    if (currentType == CalendarType.jalali) {
      final j = Jalali.fromDateTime(date);
      return _formatJalali(j, pattern);
    } else {
      return _formatGregorian(date, pattern);
    }
  }

  static String dayOfMonth(DateTime date) {
    if (currentType == CalendarType.jalali) {
      return Jalali.fromDateTime(date).day.toString();
    }
    return date.day.toString();
  }

  static String monthName(DateTime date) {
    if (currentType == CalendarType.jalali) {
      return Jalali.fromDateTime(date).formatter.mN;
    }
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[date.month - 1];
  }

  static String year(DateTime date) {
    if (currentType == CalendarType.jalali) {
      return Jalali.fromDateTime(date).year.toString();
    }
    return date.year.toString();
  }

  static String _formatJalali(Jalali j, String pattern) {
    return '${j.year}/${j.month.toString().padLeft(2, '0')}/${j.day.toString().padLeft(2, '0')}';
  }

  static String _formatGregorian(DateTime d, String pattern) {
    return '${d.year}/${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}';
  }
}
