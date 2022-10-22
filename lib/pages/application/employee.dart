import 'package:flutter/material.dart';
import 'package:myapp/common/models/models.dart';
import 'package:myapp/pages/application/useredit.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {

  List<User> getUser(){
    final data = [
      User(account: "captain", name: "captain"),
      User(account: "b12345678",name: "Galen"),
      User(account: "b12346780",name: "Alen"),
      User(account: "b12aaaaa8",name: "Blen"),
      User(account: "b1234ahho",name: "Clen")
    ];
    return data;
  }

  Widget _buildEmployees(List<User> users){
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
            enabled: !user.isCaptain(),
            title: Text(user.name),
            subtitle: Text(user.account),
            leading: CircleAvatar(backgroundColor: Colors.blue[900],child: Icon(Icons.person,color: Colors.white,),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => UserEditPage(user: user))
              ));
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        label: Text(
          "新船員",
          style: TextStyle(fontSize: 14,height: 1.0),
          textAlign: TextAlign.center,
          
        ),
        icon: Icon(Icons.person_add),
        onPressed: (){},
      ),
      body: Container(
        child: Center(
          child: _buildEmployees(getUser())
        ),
      ),
    );
    
  }
}