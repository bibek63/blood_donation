import 'package:blood_donation/constants.dart';
import 'package:blood_donation/controller/auth_controller.dart';

import 'package:blood_donation/screens/request_display.dart';
import 'package:blood_donation/screens/request_screen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Donation"),
        backgroundColor: containerColor,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: width,
            height: 150,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              child: const Center(
                  child: Text(
                "Request",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              onTap: () => Get.to(() => RequestScreen()),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: width,
            height: 150,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              child: const Center(
                  child: Text(
                "View Requests",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              onTap: () => Get.to(() => RequestDisplay()),
            ),
          )
        ],
      ),
    );
  }
}
