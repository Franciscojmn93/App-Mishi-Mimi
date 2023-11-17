import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'editar_perfil_widget.dart' show EditarPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarPerfilModel extends FlutterFlowModel<EditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  // State field(s) for txtDirection widget.
  FocusNode? txtDirectionFocusNode;
  TextEditingController? txtDirectionController;
  String? Function(BuildContext, String?)? txtDirectionControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtPhoneNum widget.
  FocusNode? txtPhoneNumFocusNode;
  TextEditingController? txtPhoneNumController;
  String? Function(BuildContext, String?)? txtPhoneNumControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtDirectionFocusNode?.dispose();
    txtDirectionController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtPhoneNumFocusNode?.dispose();
    txtPhoneNumController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
