import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import './globals.dart';

class Document<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  DocumentReference ref;

  Document({this.path}) {
    ref = _db.doc(path);
  }

  Future<T> getData() {
    return ref.get().then((v) => Global.models[T](v.data) as T);
  }

  Stream<T> streamData() {
    return ref.snapshots().map((v) => Global.models[T](v.data) as T);
  }

  Future<void> upsert(Map data) {
    return ref.set(Map<String, dynamic>.from(data), SetOptions(merge: true));
  }
}

class Collection<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  CollectionReference ref;

  Collection({this.path}) {
    ref = _db.collection(path);
  }

  Future<List<T>> getData() async {
    QuerySnapshot snapshots = await ref.get();
    return snapshots.docs.map((doc) => Global.models[T](doc.data) as T);
  }

  Stream<List<T>> streamData() {
    return ref
        .snapshots()
        .map((list) => list.docs.map((doc) => Global.models[T](doc.data) as T));
  }
}
