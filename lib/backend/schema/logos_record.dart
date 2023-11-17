import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogosRecord extends FirestoreRecord {
  LogosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _logo = snapshotData['logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logos');

  static Stream<LogosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogosRecord.fromSnapshot(s));

  static Future<LogosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogosRecord.fromSnapshot(s));

  static LogosRecord fromSnapshot(DocumentSnapshot snapshot) => LogosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogosRecordData({
  String? uid,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogosRecordDocumentEquality implements Equality<LogosRecord> {
  const LogosRecordDocumentEquality();

  @override
  bool equals(LogosRecord? e1, LogosRecord? e2) {
    return e1?.uid == e2?.uid && e1?.logo == e2?.logo;
  }

  @override
  int hash(LogosRecord? e) => const ListEquality().hash([e?.uid, e?.logo]);

  @override
  bool isValidKey(Object? o) => o is LogosRecord;
}
