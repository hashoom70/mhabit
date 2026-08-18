enum CalendarType {
  gregorian,
  jalali,
}

extension CalendarTypeExtension on CalendarType {
  String get displayName {
    switch (this) {
      case CalendarType.gregorian:
        return 'میلادی';
      case CalendarType.jalali:
        return 'شمسی';
    }
  }

  static CalendarType fromString(String? value) {
    switch (value) {
      case 'jalali':
        return CalendarType.jalali;
      case 'gregorian':
      default:
        return CalendarType.gregorian;
    }
  }

  String get value {
    switch (this) {
      case CalendarType.gregorian:
        return 'gregorian';
      case CalendarType.jalali:
        return 'jalali';
    }
  }
}
