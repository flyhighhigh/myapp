import 'package:flutter/material.dart';
import 'package:myapp/global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  _handleLogout() {
    final snackbar = SnackBar(content: Text("登出成功"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Global.deleteProfile();
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/login', (Route<dynamic> route) => false); // 導航至login
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "${Global.profile!.name}",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            height: 1.0),
      ),
    );
  }

  Widget _buildLogoutButton() {
    // 登出按鈕
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 300,
      height: 50,
      child: MaterialButton(
        onPressed: () {
          _handleLogout();
        },
        child: Text(
          "登出",
          style: TextStyle(
              color: Colors.red[900],
              fontWeight: FontWeight.normal,
              fontSize: 16,
              textBaseline: TextBaseline.alphabetic,
              height: 1.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildTitle(),
            Spacer(),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }
}
