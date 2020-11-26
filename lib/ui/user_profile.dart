import 'package:ange/api/currentUserModel.dart';
import 'package:ange/api/registerModel.dart';
import 'package:ange/ui/networkHandler/network_handler.dart';
import 'package:ange/ui/registration/model/registerModel.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  RegisterModel registerModel = RegisterModel();
  CurrentUserModel currentUserModel = CurrentUserModel();
  NetworkHandler networkHandler = NetworkHandler();
  RegistersModel registersModel = RegistersModel();

  bool isLoaded = false;
  void getCurrentUser() async {
    final currentUser = await networkHandler.get('/api/users/auth');

    setState(() {
      registersModel = RegistersModel.fromJson(currentUser);
      isLoaded = true;
      print(registersModel.name);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close, color: Colors.white)),
        title: Text('Account', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF282828),
      ),
      body: isLoaded == true ? SingleChildScrollView(
        child: Container(
          color: Color(0xFF282828),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/man-156584__340.webp'),
                        radius: 30),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(registersModel.name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0)),
                        SizedBox(height: 5.0),
                        Text(registersModel.email,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0)),
                        SizedBox(height: 5.0),
                        Text('Manage your Google Account',
                            style: TextStyle(color: Colors.lightBlue))
                      ],
                    )
                  ],
                ),
              ),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.shopping_cart, color: Color(0xFF909090)),
                title: Text('Your Items ordered',
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.favorite_border, color: Color(0xFF909090)),
                title: Text('Favorite items',
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.access_time, color: Color(0xFF909090)),
                title:
                    Text('Time watched', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.video_library, color: Color(0xFF909090)),
                title: Text('Get App Premium',
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.monetization_on, color: Color(0xFF909090)),
                title: Text('Paid memberships',
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading:
                    Icon(Icons.supervisor_account, color: Color(0xFF909090)),
                title: Text('Switch account',
                    style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.warning, color: Color(0xFF909090)),
                title: Text('Pending delivery',
                    style: TextStyle(color: Colors.white)),
              ),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.settings, color: Color(0xFF909090)),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.help, color: Color(0xFF909090)),
                title: Text('Help & feedback',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ):Text('Refreshing....'),
    );
  }
}
