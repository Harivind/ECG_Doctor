import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/models/data.dart';
import 'package:doctor/screens/patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientList extends StatelessWidget {
  static String id = "PatientListScreen";

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    color: Colors.indigo,
                  ),
                ],
                gradient: purpleGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome\nDr. ${Provider.of<Data>(context).loggedIntUser.displayName}',
                        style: greetingTitleStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'See How your patients are doing!',
                    style: greetingSubtitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      Provider.of<Data>(context, listen: false)
                          .loggedIntUser
                          .photoUrl,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        TextField(),
        FlatButton(
          onPressed: () {
            print(
                // Provider.of<Data>(context, listen: false).patients[0]['name']);
                Provider.of<Data>(context, listen: false).patients[0]
                    ['Status']);
          },
          child: Text('debug'),
        ),
        Text(
          'Your Patients',
          textAlign: TextAlign.center,
        ),
        Provider.of<Data>(context).patientCount == 0
            ? Text('Please Add Patients')
            : Expanded(
                // child: GridView.builder(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     childAspectRatio: 0.8,
                //     crossAxisCount:
                //         (orientation == Orientation.portrait) ? 2 : 3,
                //   ),
                //   itemBuilder: (context, index) {
                //     return new Card(
                //       margin: EdgeInsets.all(10),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(10),
                //         ),
                //       ),
                //       elevation: 3.0,
                //       child: GridTile(
                //         footer: Text(
                //           Provider.of<Data>(context).patients[index]['name'],
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         child: Container(
                //           height: 20,
                //           child: CachedNetworkImage(
                //             fit: BoxFit.fitWidth,
                //             imageUrl: Provider.of<Data>(context).patients[index]
                //                 ['photoURL'],
                //             alignment: Alignment.center,
                //             placeholder: (context, url) => Padding(
                //               padding: const EdgeInsets.all(36.0),
                //               child: CircleAvatar(
                //                 radius: 20,
                //                 child: Text(
                //                   Provider.of<Data>(context).patients[index]
                //                       ['name'][0],
                //                   style: TextStyle(fontSize: 30),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                //   itemCount: Provider.of<Data>(context).patientCount,
                // ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      elevation: 2.5,
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        leading: Hero(
                          tag: 'photo',
                          child: CachedNetworkImage(
                            placeholder: (context, url) => CircleAvatar(
                              child: Text(
                                Provider.of<Data>(context).patients[index]
                                    ['name'][0],
                              ),
                            ),
                            imageUrl: Provider.of<Data>(context).patients[index]
                                ['photoURL'],
                          ),
                        ),
                        title: Text(
                          Provider.of<Data>(context).patients[index]['name'],
                        ),
                        subtitle: Text(
                            "ID: ${Provider.of<Data>(context).patients[index]['patientID']}"),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return PatientScreen(index: index);
                            },
                          ));
                        },
                        trailing: Icon(
                          Icons.add_alert,
                          color: Provider.of<Data>(context).patients[index]
                                      ['Status'] ==
                                  'good'
                              ? Colors.grey
                              : Colors.red,
                        ),
                      ),
                    );
                  },
                  itemCount: Provider.of<Data>(context).patientCount,
                ),
              ),
      ],
    );
  }
}
