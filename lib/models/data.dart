import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  FirebaseUser currentUser;
  List patients = [];
  List<FlSpot> ecgGraph = [
    FlSpot(0, 0),
  ];
  int get patientCount {
    return patients.length;
  }

  void addPoints(List points) {
    ecgGraph = [
      FlSpot(0, 0),
    ];
    for (int j = 0; j < 370; j++) {
      ecgGraph.add(FlSpot(
        j.toDouble(),
        points[j],
      ));
    }
    notifyListeners();
  }

  void setPatients(List<DocumentSnapshot> patients) {
    print(patients);
    patients.retainWhere(
        (element) => element.data['doctorID'].containsKey(currentUser.uid));
    this.patients = patients;
  }

  Future<void> getPatients() async {
    await Firestore.instance
        .collection('patients')
        .getDocuments()
        .then((value) => setPatients(value.documents));
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
