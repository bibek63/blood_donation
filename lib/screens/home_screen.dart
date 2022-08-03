import 'package:blood_donation/constants.dart';

import 'package:blood_donation/screens/request_display.dart';
import 'package:blood_donation/screens/request_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import 'package:blood_donation/controller/auth_controller.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/foundation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: const Center(
            child: Text("Blood Donation",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
        backgroundColor: containerColor,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image(
              image: const AssetImage('images/bg.png'),
              width: size.width,
              height: 150,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: containerColor,
                ),
                height: size.height * 0.5,
                width: size.width,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: emergency.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                        width: size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              emergency[index]['name'],
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              emergency[index]['pno'],
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                                onPressed: () {
                                  launchUrlString(
                                      "tel://${emergency[index]['pno']}");
                                },
                                icon: const Icon(Icons.phone_forwarded))
                          ],
                        ),
                      );
                    })),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  width: 150,
                  height: 75,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Request",
                            style: TextStyle(
                                fontSize: 22.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.bloodtype,
                            color: Colors.white,
                          ),
                        ]),
                    onTap: () => Get.to(() => const RequestScreen()),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Ink(
                  width: 150,
                  height: 75,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Donate",
                            style: TextStyle(
                                fontSize: 22.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.aod_outlined,
                            color: Colors.white,
                          ),
                        ]),
                    onTap: () => Get.to(() => RequestDisplay()),
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //     onPressed: () => AuthController().logoutUser(),
            //     child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
