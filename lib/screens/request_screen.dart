import 'package:blood_donation/controller/requests_controller.dart';
import 'package:blood_donation/controller/test.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  String bloodGroup = 'O+';
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Request",
            style: TextStyle(
              color: containerColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      //name
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: nameController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: borderColor,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor)),
                            label: const Text(
                              "Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //blood group
                      const SizedBox(
                        height: 15,
                      ),
                      //email

                      //password
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: addressController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: borderColor,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor)),
                            label: const Text(
                              "Address",
                              style: TextStyle(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: borderColor,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor)),
                            label: const Text(
                              "Phone Number",
                              style: TextStyle(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        dropdownColor: containerColor,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: borderColor,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor)),
                            hintText: "Blood Group",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor))),
                        value: bloodGroup,
                        items: <String>[
                          "O+",
                          "A+",
                          "O-",
                          "A-",
                          "B+",
                          "B-",
                          "AB+",
                          "AB-"
                        ].map((String value) {
                          return DropdownMenuItem(
                            alignment: Alignment.center,
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          bloodGroup = newValue!;
                          // setState(() {
                          //   bloodGroup = newValue!;
                          // });
                        },
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(containerColor)),
                  onPressed: () => RequestController().request(
                      nameController.text,
                      addressController.text,
                      bloodGroup,
                      phoneNumberController.text),
                  child: const Text("Request"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
