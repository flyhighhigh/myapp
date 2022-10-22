import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DateTime _date = DateTime.now();

  _dateString() {
    return "${_date.year}/${_date.month}/${_date.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        label: Text(
          "建立",
          style: TextStyle(fontSize: 14, height: 1.0),
          textAlign: TextAlign.center,
        ),
        icon: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Container(
        child: Center(
            child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 200,
            height: 40,
            child: TextButton.icon(
              onPressed: (() async {
                final result = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  locale: Locale('zh','TW')
                );
                setState(() {
                  _date = result ?? DateTime.now();
                });
              }),
              style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              label: Text(
                _dateString(),
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    textBaseline: TextBaseline.alphabetic,
                    height: 1.0),
              ),
              icon: Icon(
                Icons.date_range,
                color: Colors.blue[900],
              ),
            ),
          ),
          Text("hello dashboard")
        ])),
      ),
    );
  }
}
