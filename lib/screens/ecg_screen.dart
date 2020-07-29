import 'package:doctor/models/data.dart';
import 'package:doctor/widgets/ecg_graph.dart';
import 'package:doctor/widgets/resuable_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EcgScreen extends StatelessWidget {
  final dynamic doc;

  EcgScreen({@required this.doc});
  @override
  Widget build(BuildContext context) {
    Provider.of<Data>(context, listen: false).addPoints(doc['data']);

    return Scaffold(
      appBar: AppBar(
        title: Text('ECG Data'),
      ),
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        children: [
          Expanded(
            child: ReusableCard(cardChild: EcgGraph(), onPress: null),
            flex: 5,
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Center(
                child: Text(
                  'REPORT',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.pink,
                  ),
                ),
              ),
              onPress: null,
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Status: ${doc['currentStatus']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'DateTime: ${DateTime.fromMillisecondsSinceEpoch(int.parse(doc['dateTime']))}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'PREDICTIONS',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'OTHERS: ${doc['prediction'][0]} ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'NORMAL: ${doc['prediction'][1]} ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'PVC: ${doc['prediction'][2]} ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'APC: ${doc['prediction'][3]} ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'PB: ${doc['prediction'][4]} ',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              onPress: null,
            ),
          ),
        ],
      ),
    );
  }
}
