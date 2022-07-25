import 'package:cloud_firestore/cloud_firestore.dart';

class BloodGroup {
  List uid;
  BloodGroup({
    required this.uid,
  });
  Map<String, dynamic> toJson() => {"uid": uid};
  static BloodGroup fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return BloodGroup(uid: snapShot['uid']);
  }
}
