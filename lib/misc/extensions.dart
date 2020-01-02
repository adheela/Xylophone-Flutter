
import 'package:flutter/widgets.dart';

extension BuildContextExt on BuildContext {
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
}

extension StateExt<T extends StatefulWidget> on State<T> {
  // ignore: invalid_use_of_protected_member
  updateState() => setState((){ });
}

extension DurationExt on int {
  Duration get  ms => Duration(milliseconds: this);
  Duration get sec => Duration(seconds: this);
}

extension StringExt on String {

  String fromAssets() => 'assets/$this';

  String repeat(int times, {String separator = ""})
  => List.filled(times, this).join(separator);

}