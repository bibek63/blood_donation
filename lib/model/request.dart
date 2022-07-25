import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  String name;
  String address;
  String bloodType;

  String phoneNumber;
  String uid;
  Request({
    required this.name,
    required this.address,
    required this.bloodType,
    required this.phoneNumber,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        'address': address,
        "phoneNumber": phoneNumber,
        "bloodType": bloodType,
        'uid': uid,
      };
  static Request fromSnap(DocumentSnapshot snapShot) {
    var snap = snapShot.data() as Map<String, dynamic>;
    return Request(
      name: snap['name'],
      address: snap['address'],
      bloodType: snap['bloodType'],
      phoneNumber: snap['phoneNumber'],
      uid: snap['uid'],
    );
  }
}
