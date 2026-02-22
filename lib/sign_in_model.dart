import 'package:flutter/material.dart';
import 'flutter_flow/field_validator.dart';
import 'main_model.dart';

/// Model for SignInWidget page.
class SignInModel extends ChangeNotifier with FlutterFlowModel {
  TextEditingController? textController1;
  FocusNode? textFieldFocusNode1;

  TextEditingController? textController2;
  FocusNode? textFieldFocusNode2;

  FieldValidator textController1Validator = const FieldValidator();
  FieldValidator textController2Validator = const FieldValidator();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController1?.dispose();
    textFieldFocusNode1?.dispose();
    textController2?.dispose();
    textFieldFocusNode2?.dispose();
    super.dispose();
  }
}
