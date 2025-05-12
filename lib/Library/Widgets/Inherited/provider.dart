import 'package:flutter/material.dart';

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const NotifierProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(notifier: model);

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widet = context
        .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.widget;
    return widet is NotifierProvider<Model> ? widet.model : null;
  }
}

class Provider<Model> extends InheritedWidget {
  final Model model;
  const Provider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static Model? watch<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widet = context
        .getElementForInheritedWidgetOfExactType<Provider<Model>>()
        ?.widget;
    return widet is Provider<Model> ? widet.model : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return model != oldWidget;
  }
}
