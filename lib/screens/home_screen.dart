import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/models/data.dart';
import 'package:doctor/screens/patient_screen.dart';
import 'package:doctor/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = "homeScreen";
  final FirebaseUser loggedInUser;

  HomeScreen({this.loggedInUser});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.person_add,
            color: Colors.black,
          ),
        ),
        body: Column(
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
            Text(
              'Your Patients',
              textAlign: TextAlign.center,
            ),
            Provider.of<Data>(context).patientCount == 0
                ? Text('Please Add Patients')
                : Expanded(
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
                                imageUrl: Provider.of<Data>(context)
                                    .patients[index]['photoURL'],
                              ),
                            ),
                            title: Text(
                              Provider.of<Data>(context).patients[index]
                                  ['name'],
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItem,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Account'),
              icon: Icon(Icons.person_outline),
            ),
          ],
          elevation: 0,
          onTap: (value) {
            if (value == 1) {
              Navigator.pushNamedAndRemoveUntil(
                  context, WelcomeScreen.id, (route) => false);
            }
            setState(() {
              selectedItem = value;
              print(selectedItem);
            });
          },
        ),
      ),
    );
  }
}
