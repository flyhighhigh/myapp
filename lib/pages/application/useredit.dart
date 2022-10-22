
import 'package:flutter/material.dart';
import 'package:myapp/common/models/models.dart';

class UserEditPage extends StatelessWidget {
  final User user;
  const UserEditPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // centerTitle: true, // 置中
        title: Text(
          "編輯船員",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: actions,
      ),
      body: Center(
        child: Column(
          children: [
            Text("this is the edit page of ${user.account} ${user.name}"),
          ],
        ),
      ),
    );
  }
}