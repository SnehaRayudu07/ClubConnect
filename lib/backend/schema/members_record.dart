import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MembersRecord extends FirestoreRecord {
  MembersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _role = snapshotData['Role'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('members')
          : FirebaseFirestore.instance.collectionGroup('members');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('members').doc(id);

  static Stream<MembersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MembersRecord.fromSnapshot(s));

  static Future<MembersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MembersRecord.fromSnapshot(s));

  static MembersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MembersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MembersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MembersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MembersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MembersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMembersRecordData({
  String? name,
  String? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class MembersRecordDocumentEquality implements Equality<MembersRecord> {
  const MembersRecordDocumentEquality();

  @override
  bool equals(MembersRecord? e1, MembersRecord? e2) {
    return e1?.name == e2?.name && e1?.role == e2?.role;
  }

  @override
  int hash(MembersRecord? e) => const ListEquality().hash([e?.name, e?.role]);

  @override
  bool isValidKey(Object? o) => o is MembersRecord;
}
