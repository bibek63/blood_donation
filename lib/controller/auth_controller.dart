import 'package:blood_donation/constants.dart';
import 'package:blood_donation/screens/auth/login.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../model/users.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  User get user => _user.value!;

  @override
  onReady() {
    super.onReady();
    _user = Rx<User?>(fireAuth.currentUser);
    _user.bindStream(fireAuth.authStateChanges());
    ever(_user, setInitialScreen);
  }

  setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  registerUser(
    String name,
    String address,
    String bloodType,
    String phoneNumber,
    String email,
    String password,
  ) async {
    try {
      if (name.isNotEmpty &&
          address.isNotEmpty &&
          bloodType.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await fireAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        model.User user = model.User(
            name: name,
            address: address,
            bloodType: bloodType,
            email: email,
            phoneNumber: phoneNumber,
            uid: cred.user!.uid);
        await fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        await setBloodGroup(user.uid, user.bloodType);
        await setAllTokens();
      } else {
        Get.snackbar("Error on Registration", "Please enter all field");
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await fireAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar("Error", "Please Enter email and password");
      }
    } catch (e) {
      Get.snackbar('Error', "Unexpected Error Occured");
    }
  }

  logoutUser() async {
    try {
      await fireAuth.signOut();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  setBloodGroup(String uid, String bg) async {
    var document = await fireStore.collection('bloodGroup').doc(bg).get();
    if (document.exists) {
      await document.reference.update({
        "uids": FieldValue.arrayUnion([uid])
      });
    } else {
      await document.reference.set({
        "uids": [uid]
      });
    }
  }

  setAllTokens() async {
    var document = await fireStore.collection('tokens').doc('all').get();
    if (document.exists) {
      await FirebaseMessaging.instance.getToken().then((token) {
        fireStore.collection('tokens').doc('all').update({
          'Tokens': FieldValue.arrayUnion([token])
        });
      });
    } else {
      await FirebaseMessaging.instance.getToken().then((token) {
        fireStore.collection('tokens').doc('all').set({
          "Tokens": [token]
        });
      });
    }
  }
}
