import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ClubName" field.
  String? _clubName;
  String get clubName => _clubName ?? '';
  bool hasClubName() => _clubName != null;

  // "Comments" field.
  List<String>? _comments;
  List<String> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "Likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "UserImage" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  bool hasUserImage() => _userImage != null;

  void _initializeFields() {
    _clubName = snapshotData['ClubName'] as String?;
    _comments = getDataList(snapshotData['Comments']);
    _likes = castToType<int>(snapshotData['Likes']);
    _description = snapshotData['Description'] as String?;
    _name = snapshotData['Name'] as String?;
    _image = snapshotData['Image'] as String?;
    _category = snapshotData['Category'] as String?;
    _userImage = snapshotData['UserImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? clubName,
  int? likes,
  String? description,
  String? name,
  String? image,
  String? category,
  String? userImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ClubName': clubName,
      'Likes': likes,
      'Description': description,
      'Name': name,
      'Image': image,
      'Category': category,
      'UserImage': userImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clubName == e2?.clubName &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.likes == e2?.likes &&
        e1?.description == e2?.description &&
        e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.category == e2?.category &&
        e1?.userImage == e2?.userImage;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.clubName,
        e?.comments,
        e?.likes,
        e?.description,
        e?.name,
        e?.image,
        e?.category,
        e?.userImage
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
