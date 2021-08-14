import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'hooks_use_ref.dart';

export 'hooks_use_ref.dart';

void useValueListenableEffect<T>(
  void Function(T) callback,
  ValueListenable<T> listenable,
) {
  final _callback = useCallback1(callback);
  useEffect(() {
    void _c() {
      _callback(listenable.value);
    }

    listenable.addListener(_c);
    return () => listenable.removeListener(_c);
  }, [listenable]);
}

void useStreamEffect<T>(
  void Function(T) callback,
  Stream<T> listenable, [
  List<Object> keys = const [],
]) {
  final _callback = useCallback1(callback);
  useEffect(
    () {
      final subs = listenable.listen(_callback);
      return subs.cancel;
    },
    [listenable, ...keys],
  );
}

T useSelectListenable<T>(
  Listenable listenable,
  T Function() select,
) {
  final state = useState<T>(select());
  final _select = useFunction0(select);
  useEffect(() {
    void _callback() {
      state.value = _select();
    }

    listenable.addListener(_callback);
    return () {
      listenable.removeListener(_callback);
    };
  }, [listenable]);
  return state.value;
}
