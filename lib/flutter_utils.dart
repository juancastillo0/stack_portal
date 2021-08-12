import 'package:flutter/material.dart';

class Inherited<T> extends InheritedWidget {
  final T data;

  const Inherited({
    required this.data,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(Inherited<T> oldWidget) {
    return oldWidget.data != this.data;
  }

  static T? maybeOf<T extends Object>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Inherited<T>>()?.data;
  }

  static T of<T extends Object>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Inherited<T>>()!.data;
  }

  static T get<T extends Object>(BuildContext context) {
    final _widget =
        context.getElementForInheritedWidgetOfExactType<Inherited<T>>()!.widget;
    return (_widget as Inherited).data as T;
  }
}

Rect? globalPaintBounds(BuildContext? context) {
  if (context == null) {
    return null;
  }
  final renderObject = context.findRenderObject();
  final translation = renderObject?.getTransformTo(null).getTranslation();
  if (translation != null && renderObject?.paintBounds != null) {
    return renderObject!.paintBounds
        .shift(Offset(translation.x, translation.y));
  } else {
    return null;
  }
}
