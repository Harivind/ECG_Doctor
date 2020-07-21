import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class Data extends ChangeNotifier {
  FirebaseUser currentUser;
  List _patients = [];

  int get patientCount {
    return _patients.length;
  }

  UnmodifiableListView<dynamic> get patients {
    return UnmodifiableListView(_patients);
  }

  Future<void> getPatients() async {
    await Firestore.instance
        .collection('patients')
        .where('doctorID', arrayContains: currentUser.uid)
        .getDocuments()
        .then((value) => _patients = value.documents);
    notifyListeners();
  }

  void addCurrentUser(FirebaseUser user) {
    currentUser = user;
    notifyListeners();
  }

  FirebaseUser get loggedIntUser {
    return currentUser;
  }
}
