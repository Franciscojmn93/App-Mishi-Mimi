import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'bt_create_user_widget.dart' show BtCreateUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BtCreateUserModel extends FlutterFlowModel<BtCreateUserWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  // State field(s) for txtpassword widget.
  FocusNode? txtpasswordFocusNode;
  TextEditingController? txtpasswordController;
  String? Function(BuildContext, String?)? txtpasswordControllerValidator;
  // State field(s) for txtDirection widget.
  FocusNode? txtDirectionFocusNode;
  TextEditingController? txtDirectionController;
  String? Function(BuildContext, String?)? txtDirectionControllerValidator;
  // State field(s) for txtphone widget.
  FocusNode? txtphoneFocusNode;
  TextEditingController? txtphoneController;
  String? Function(BuildContext, String?)? txtphoneControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtpasswordFocusNode?.dispose();
    txtpasswordController?.dispose();

    txtDirectionFocusNode?.dispose();
    txtDirectionController?.dispose();

    txtphoneFocusNode?.dispose();
    txtphoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
