class SchedulableTime {
  const SchedulableTime([
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
  ])  : assert(hour >= 0 && hour < 24),
        assert(minute >= 0 && minute < 60),
        assert(second >= 0 && second < 60);

  /// The hour component of the time.
  ///
  /// Accepted range is 0 to 23 inclusive.
  final int hour;

  /// The minutes component of the time.
  ///
  /// Accepted range is 0 to 59 inclusive.
  final int minute;

  /// The seconds component of the time.
  ///
  /// Accepted range is 0 to 59 inclusive.
  final int second;

  /// Creates a [Map] object that describes the [Time] object.
  ///
  /// Mainly for internal use to send the data over a platform channel.
  Map<String, int> toMap() {
    return <String, int>{
      'hour': hour,
      'minute': minute,
      'second': second,
    };
  }
}
