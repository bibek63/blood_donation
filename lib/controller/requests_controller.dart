import 'package:blood_donation/constants.dart';
import 'package:blood_donation/model/request.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  final Rx<List<Request>> _request = Rx<List<Request>>([]);
  List<Request> get requests => _request.value;

  getRequest() async {
    _request.bindStream(
        fireStore.collection('requests').snapshots().map((var query) {
      List<Request> retValue = [];
      for (var element in query.docs) {
        retValue.add(Request.fromSnap(element));
      }
      return retValue;
    }));
  }

  request(
    String name,
    String address,
    String bloodType,
    String phoneNumber,
  ) async {
    try {
      if (name.isNotEmpty &&
          address.isNotEmpty &&
          bloodType.isNotEmpty &&
          phoneNumber.isNotEmpty) {
        var cred = fireAuth.currentUser?.uid;

        Request request = Request(
            name: name,
            address: address,
            bloodType: bloodType,
            phoneNumber: phoneNumber,
            uid: cred!);
        await fireStore.collection('requests').doc(cred).set(request.toJson());
        Get.snackbar("Request", "Request sent successfully");
        Get.to(() => const HomeScreen());
      } else {
        Get.snackbar("Error on Request", "Please enter all field");
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
