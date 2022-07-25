import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String address;
  String bloodType;
  String email;

  String phoneNumber;
  String uid;
  User({
    required this.name,
    required this.address,
    required this.bloodType,
    required this.email,
    required this.phoneNumber,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        'address': address,
        "email": email,
        "phoneNumber": phoneNumber,
        "bloodType": bloodType,
        'uid': uid,
      };
  static User fromSnap(DocumentSnapshot snapShot) {
    var snap = snapShot.data() as Map<String, dynamic>;
    return User(
      name: snap['name'],
      address: snap['address'],
      bloodType: snap['bloodType'],
      email: snap['email'],
      phoneNumber: snap['phoneNumber'],
      uid: snap['uid'],
    );
  }
}
