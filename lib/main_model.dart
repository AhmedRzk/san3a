import 'package:flutter/material.dart';

/// Mixin for widget models to manage state and lifecycle.
mixin FlutterFlowModel on ChangeNotifier {
  void initState(BuildContext context) {}
}

/// Model for MainWidget.
class MainModel extends ChangeNotifier with FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
}

/// Factory to create and initialize models.
T createModel<T extends ChangeNotifier>(
  BuildContext context,
  T Function() createFn,
) {
  final model = createFn();
  if (model is FlutterFlowModel) {
    model.initState(context);
  }
  return model;
}
