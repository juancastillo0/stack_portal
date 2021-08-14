import 'package:flutter_hooks/flutter_hooks.dart';

Ref<T> useRefValue<T>(T value) {
  final valueRef = useMemoized(() => Ref(value));
  valueRef.value = value;
  return valueRef;
}

class Ref<T> {
  T value;
  Ref(this.value);
}

void Function() useCallback0(void Function() callback) {
  final valueRef = useRefValue(callback);
  final value = useMemoized(() {
    return () {
      valueRef.value();
    };
  });
  return value;
}

void Function(T) useCallback1<T>(void Function(T) callback) {
  final valueRef = useRefValue(callback);
  final value = useMemoized(() {
    return (T value) {
      valueRef.value(value);
    };
  });
  return value;
}

void Function(T, V) useCallback2<T, V>(void Function(T, V) callback) {
  final valueRef = useRefValue(callback);
  final value = useMemoized(() {
    return (T p0, V p1) {
      valueRef.value(p0, p1);
    };
  });
  return value;
}

O Function() useFunction0<O>(O Function() callback) {
  final valueRef = useRefValue(callback);
  final value = useMemoized(() {
    return () {
      return valueRef.value();
    };
  });
  return value;
}

O Function(T) useFunction1<T, O>(O Function(T) callback) {
  final valueRef = useRefValue(callback);
  final value = useMemoized(() {
    return (T value) {
      return valueRef.value(value);
    };
  });
  return value;
}

O Function(T, V) useFunction2<T, V, O>(O Function(T, V) callback) {
  final valueRef = useRefValue(callback);
  final value = useMemoized(() {
    return (T p0, V p1) {
      return valueRef.value(p0, p1);
    };
  });
  return value;
}
