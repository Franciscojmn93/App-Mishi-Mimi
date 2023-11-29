import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtPassword widget.
  FocusNode? txtPasswordFocusNode;
  TextEditingController? txtPasswordController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordControllerValidator;
  // State field(s) for txtEmailCreate widget.
  FocusNode? txtEmailCreateFocusNode;
  TextEditingController? txtEmailCreateController;
  String? Function(BuildContext, String?)? txtEmailCreateControllerValidator;
  String? _txtEmailCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x5u5hty4' /* Este campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for txtPasswordCreate widget.
  FocusNode? txtPasswordCreateFocusNode;
  TextEditingController? txtPasswordCreateController;
  late bool txtPasswordCreateVisibility;
  String? Function(BuildContext, String?)? txtPasswordCreateControllerValidator;
  String? _txtPasswordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wusdksen' /* Este campo es requrido */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'yx00fizf' /* La contraseña debe tener minim... */,
      );
    }
    if (val.length > 12) {
      return FFLocalizations.of(context).getText(
        '7w3rpdaf' /* La contraseña debe tener maxim... */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtPasswordVisibility = false;
    txtEmailCreateControllerValidator = _txtEmailCreateControllerValidator;
    txtPasswordCreateVisibility = false;
    txtPasswordCreateControllerValidator =
        _txtPasswordCreateControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtPasswordFocusNode?.dispose();
    txtPasswordController?.dispose();

    txtEmailCreateFocusNode?.dispose();
    txtEmailCreateController?.dispose();

    txtPasswordCreateFocusNode?.dispose();
    txtPasswordCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
