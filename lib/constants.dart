import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var containerColor = const Color.fromARGB(255, 243, 92, 92);
var borderColor = Colors.white;
var formTextColor = Colors.white;

var fireAuth = FirebaseAuth.instance;
var fireStore = FirebaseFirestore.instance;

List emergency = [
  {
    'name': 'Police',
    'pno': '100',
  },
  {
    'name': 'Ambulance',
    'pno': '102',
  },
  {
    'name': 'Fire Brigade',
    'pno': '101',
  },
  {
    'name': 'Child Helpline',
    'pno': '104',
  },
  {
    'name': 'Crime Info',
    'pno': '014412748',
  },
  {
    'name': 'Tourist Police',
    'pno': '1144',
  },
  {
    'name': 'Dog Rescue',
    'pno': '061520374',
  },
];
