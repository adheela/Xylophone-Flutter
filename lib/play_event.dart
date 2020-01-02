import 'package:scoped_model/scoped_model.dart';

class PlayEvent extends Model {
  int _value = 0;

  bool get x1value => _value > 0;
  bool get x3value => _value >= 3;

  void fire() {
    if (x3value) return;
    _value++;
    notifyListeners();
  }
}
