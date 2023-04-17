import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO isn't used so I am not sure how to categorize it.
class GenericStateNotifier<V> extends StateNotifier<V> {
  GenericStateNotifier(V d) : super(d);

  set value(V v) {
    state = v;
  }

  V get value => state;
}
