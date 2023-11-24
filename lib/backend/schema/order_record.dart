import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "selectedItems" field.
  List<DocumentReference>? _selectedItems;
  List<DocumentReference> get selectedItems => _selectedItems ?? const [];
  bool hasSelectedItems() => _selectedItems != null;

  // "isSinpe" field.
  bool? _isSinpe;
  bool get isSinpe => _isSinpe ?? false;
  bool hasIsSinpe() => _isSinpe != null;

  // "isCash" field.
  bool? _isCash;
  bool get isCash => _isCash ?? false;
  bool hasIsCash() => _isCash != null;

  // "isCard" field.
  bool? _isCard;
  bool get isCard => _isCard ?? false;
  bool hasIsCard() => _isCard != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _tax = castToType<double>(snapshotData['tax']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _selectedItems = getDataList(snapshotData['selectedItems']);
    _isSinpe = snapshotData['isSinpe'] as bool?;
    _isCash = snapshotData['isCash'] as bool?;
    _isCard = snapshotData['isCard'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  bool? isSinpe,
  bool? isCash,
  bool? isCard,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'amount': amount,
      'status': status,
      'tax': tax,
      'created_at': createdAt,
      'isSinpe': isSinpe,
      'isCash': isCash,
      'isCard': isCard,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        e1?.tax == e2?.tax &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.selectedItems, e2?.selectedItems) &&
        e1?.isSinpe == e2?.isSinpe &&
        e1?.isCash == e2?.isCash &&
        e1?.isCard == e2?.isCard;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.name,
        e?.amount,
        e?.status,
        e?.tax,
        e?.createdAt,
        e?.selectedItems,
        e?.isSinpe,
        e?.isCash,
        e?.isCard
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
