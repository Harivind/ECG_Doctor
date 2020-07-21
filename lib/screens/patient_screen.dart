import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/models/data.dart';
import 'package:doctor/screens/chat_screen.dart';
import 'package:doctor/screens/notes_screen.dart';
import 'package:doctor/widgets/resuable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PatientScreen extends StatelessWidget {
  static String id = "patientScreen";
  final int index;

  const PatientScreen({@required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'photo',
                child: Container(
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => CircleAvatar(
                        child: Text(
                          Provider.of<Data>(context).patients[index]['name'][0],
                        ),
                      ),
                      imageUrl: Provider.of<Data>(context).patients[index]
                          ['photoURL'],
                    ),
                  ),
                ),
              ),
              Text(
                'Name: ${Provider.of<Data>(context).patients[index]['name']}',
              ),
              Text(
                'Patient ID: ${Provider.of<Data>(context).patients[index]['patientID']}',
              ),
              Text(
                'Status: ${Provider.of<Data>(context).patients[index]['status']}',
              ),
              FlatButton(
                onPressed: () {},
                child: Text('View ECG Data'),
                color: Colors.grey,
              ),
              FlatButton(
                onPressed: () {},
                child: Text('View Analysis'),
                color: Colors.grey,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ecg.svg',
                              semanticsLabel: 'Acme Logo',
                              height: 50,
                            ),
                            Text('View ECG Data'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ecg.svg',
                              semanticsLabel: 'Acme Logo',
                              // height: 200,
                            ),
                            Text('View Summary'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ecg.svg',
                              semanticsLabel: 'Acme Logo',
                              // height: 200,
                            ),
                            Text('ECG Data'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ecg.svg',
                              semanticsLabel: 'Acme Logo',
                              // height: 200,
                            ),
                            Text('ECG Data'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => NotesScreen(
                      patientID: Provider.of<Data>(context).patients[index]
                          ['patientID'],
                    ),
                  );
                },
                child: Text('View Notes'),
                color: Colors.grey,
              ),
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatScreen(
                          patientIndex: index,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
