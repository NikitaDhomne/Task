import 'package:bynry_task/Screens/signin_screen.dart';
import 'package:bynry_task/Widgets/heading_title.dart';
import 'package:bynry_task/Widgets/quick_actions_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  String _username = ''; // State variable to store the username

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    checkUser();
    print(_user!.email);
    print(_user!.uid);
  }

  void checkUser() async {
    try {
      if (_user != null) {
        var snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(_user!.uid)
            .get();

        if (snapshot.exists) {
          var userData = snapshot.data();
          String? username = userData?['username'];
          if (username != null) {
            setState(() {
              _username = username; // Store the username in the state variable
            });
            print('Username for UID ${_user!.uid}: $username');
          } else {
            print('Username not found for UID ${_user!.uid}');
          }
        } else {
          print('User with UID ${_user!.uid} does not exist');
        }
      } else {
        print('Current user is null');
      }
    } catch (e) {
      print('Error occurred while checking user: $e');
    }
  }

  String selectedDuration = 'Last Month';

  List<QuickActionsItem> _listquickactionItem = [
    QuickActionsItem("Bills", "images/bill.png"),
    QuickActionsItem("Disconnect", "images/bill.png"),
    QuickActionsItem("Transfer", "images/bill.png"),
    QuickActionsItem("Services", "images/bill.png"),
    QuickActionsItem("Complaint", "images/bill.png"),
    QuickActionsItem("Update", "images/bill.png"),
    QuickActionsItem("Connection", "images/bill.png"),
    QuickActionsItem("Outage", "images/bill.png"),
  ];

  void _onFontChanged(String? value) {
    if (value != null) {
      setState(() {
        selectedDuration = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5100E1),
      appBar: AppBar(
        backgroundColor: Color(0xff5100E1),
        actions: [
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_username),
              accountEmail: Text(_user!.email.toString()),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 40),
              alignment: Alignment.topLeft,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://pics.craiyon.com/2023-05-30/eaab7f873e324b3e8f41f5aba2c2aeb2.webp'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          _username,
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 50,
                      child: Divider(
                        height: 14,
                        thickness: 3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: HeadingTitle(title: 'Quick Actions'),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 80),
                        itemCount: _listquickactionItem.length,
                        itemBuilder: (context, index) => QuickActionsItem(
                            _listquickactionItem[index].title,
                            _listquickactionItem[index].icondata),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Divider(
                      thickness: 10,
                      color: Color(0xffEBEBEB),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 180,
                    // color: Colors.orange,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Gas',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 22,
                              child: VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(child: HeadingTitle(title: 'SA1234567')),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton<String>(
                                value: selectedDuration,
                                items: ['Last Month', 'This Month', 'This Year']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged:
                                    _onFontChanged, // Use the callback method
                                underline: Container(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              'images/circular.png',
                              fit: BoxFit.contain,
                            ),
                            title: Text('Bills'),
                            subtitle: Text('20 Jan 2020'),
                            trailing: Text(
                              "\$43",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
