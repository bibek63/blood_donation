import 'dart:convert';

import 'package:blood_donation/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Test extends GetxController {
  requestBlood() async {
    var token = await fireStore.collection('tokens').doc('all').get();
    sendPushMessage(" body", "title", token["Tokens"]);
  }

  void sendPushMessage(String body, String title, List token) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=1088085602386',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
      print('done $token');
    } catch (e) {
      print("error push notification");
    }
  }
}


//1088085602386