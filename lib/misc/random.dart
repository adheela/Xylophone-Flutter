
import 'dart:math';

final random = Random.secure();

int randomize(int edge, {int shift, int uniqTo, bool allowEdge = true}) {
  assert(edge != null);
  var value;
  do {
    value = random.nextInt(edge) + (shift ?? 0 );
  } while (value == uniqTo || (!allowEdge && value == edge));
  return value;
}
