import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return this.isOnSameDay(now);
  }

  bool get isBeforeToday {
    final now = DateTime.now();
    return !isToday && this.isBefore(now);
  }

  bool get isAfterToday {
    final now = DateTime.now();
    return !isToday && this.isAfter(now);
  }

  String get appFormattedDateTime => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  String get appFormattedDate => DateFormat('yyyy-MM-dd').format(this);

  bool isOnSameDay(DateTime other) =>
      this.day == other.day &&
          this.month == other.month &&
          this.year == other.year;

  bool get isMorning => this.hour < 12;

  bool get isAfternoon => this.hour >= 12 && this.hour < 5;

  bool get isEvening => this.hour >= 5;

  String _timeAgoSinceDate({bool numericDates = true}) {
    DateTime date = this.toLocal();
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours < 60) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays < 6) {
      return '${difference.inDays} days ago';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if ((difference.inDays / 7).ceil() < 4) {
      return '${(difference.inDays / 7).ceil()} weeks ago';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 30).ceil() < 30) {
      return '${(difference.inDays / 30).ceil()} months ago';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    return '${(difference.inDays / 365).floor()} years ago';
  }

  String showTimeAgo() {
    return _timeAgoSinceDate();
  }

  String showDateTime({bool isZeroTimeAllowed = false}) {
    if (isZeroTimeAllowed || this.hour != 0 || this.minute != 0 || this.second != 0) {
      return appFormattedDateTime;
    } else {
      return appFormattedDate;
    }
  }
}