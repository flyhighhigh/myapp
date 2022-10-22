import 'package:flutter/material.dart';
import 'package:myapp/common/models/models.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {

  List<DataRow> getRows(){
    final data = [
      ["2022/7/30","09:00","登入失敗"],
      ["2022/8/21","10:00","建立出勤紀錄"],
      ["2022/9/30","11:00","登入成功"],
      ["2022/10/3","12:00","修改密碼"],
      ["2022/11/9","13:00","登出成功"]
    ];
    return data.map((data) {
      final cells = [data[0],data[1],data[2]];
      
      return DataRow(cells: cells.map((cell) => DataCell(Text(cell))).toList());
    }).toList();
  }

  Widget _buildLogsTable(){
    final columns = ["日期","時間","內容"];
    final cols = columns.map((col) => DataColumn(label: Text(col))).toList();

    
    return DataTable(
      columns: cols,
      rows: getRows(),
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: _buildLogsTable(),
      ),
    );
  }
}