import 'dart:ui';

import 'package:blood_donation/constants.dart';
import 'package:blood_donation/controller/requests_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestDisplay extends StatelessWidget {
  RequestDisplay({Key? key}) : super(key: key);
  final RequestController requestController = Get.put(RequestController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    requestController.getRequest();
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(20)),
          width: width - 50,
          height: height * 0.7,
          child: SingleChildScrollView(
              child: SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    return requestController.requests.isEmpty
                        ? const Center(
                            child: Text(
                              "No Request",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            itemCount: requestController.requests.length,
                            itemBuilder: (context, index) {
                              final request = requestController.requests[index];
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: ListTile(
                                  title: Text(
                                    request.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  leading: Text(
                                    request.bloodType,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    request.phoneNumber,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  subtitle: Text(request.address),
                                ),
                              );
                            });
                  }),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
