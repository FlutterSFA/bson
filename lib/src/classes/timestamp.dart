import 'package:bson/src/statics.dart';

class Timestamp {
  Timestamp([int? _seconds, int? _increment])
      : seconds = _seconds ??=
            (DateTime.now().millisecondsSinceEpoch ~/ 1000).toInt(),
        increment = _increment ?? Statics.nextIncrement;

  final int seconds;
  final int increment;

  @override
  String toString() => 'Timestamp($seconds, $increment)';
}
