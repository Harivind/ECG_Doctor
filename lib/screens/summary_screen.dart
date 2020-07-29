import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/models/data.dart';
import 'package:doctor/screens/ecg_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  final int index;

  SummaryScreen({@required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection(
                'patients/${Provider.of<Data>(context).patients[index]['patientID']}/ECG')
            .where('currentStatus',
                isEqualTo: "Premature ventricular contractions ")
            .snapshots(),
        builder: (context, snapshot) {
          List docs = [];
          if (snapshot.hasData) {
            List docs = snapshot.data.documents;
            docs.sort((a, b) =>
                int.parse(b.data['dateTime']) - int.parse(a.data['dateTime']));
          }

          return docs.length != 0
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    print(docs.length);
                    return ListTile(
                      title: Text('Status: ${docs[index]['currentStatus']}'),
                      subtitle: Text(
                          'DateTime: ${DateTime.fromMillisecondsSinceEpoch(int.parse(docs[index]['dateTime']))}'),
                      trailing: Icon(Icons.show_chart),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EcgScreen(doc: docs[index]),
                            ));
                      },
                    );
                  },
                  itemCount: docs.length,
                )
              : Center(child: Text('ALL Good'));
        },
      ),
    );
  }
}
