import 'package:flutter/material.dart';
import 'package:myapp/common/utils/utils.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  // 表單的Key
  final formKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  _handleResetPassword() async { // TODO
    final name = await DatabaseUtil().resetUserPassword(_firstController.text);
    // 找不到此用戶
    if(name == null){ 
      final snackbar = SnackBar(content: Text("重置失敗，該帳號不存在"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    final snackbar = SnackBar(content: Text("帳號 ${name} 重置成功，預設密碼與帳號相同"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    return;

  }

  // title
  Widget _buildTitle() {
    return Container(
    width: 110,
    margin: EdgeInsets.only(top: 120),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Container(
        //   height: 100,
        //   width: 100,
        //   child: CircleAvatar(
        //     radius: 100,
        //     backgroundImage: AssetImage("assets/images/boat_flat_design.jpg"),
        //   )
        // ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            "重置密碼",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 1.0
            ),
          ),
        ),
      ],
    ),
  );
  }

  // 帳號表單 + 重置密碼按鈕
  Widget _buildInputForm() {
    return Container(
      width: 300,
      height: 204,
      // margin: EdgeInsets.only(top: 30),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(children: [
        Container( // 帳號輸入框
          // margin: EdgeInsets.only(top: 15),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty){
                return "帳號不能為空";
              }
              return null;
            },
            controller: _firstController,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: "身分證字號/帳號",
              contentPadding: EdgeInsets.fromLTRB(20,0,0,0),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              textBaseline: TextBaseline.alphabetic,
              height: 1.0
            ),
            maxLines: 1,
            autocorrect: false, // 自動糾正
            obscureText: false, // 隱藏輸入
          ),
        ),
        Container( // 帳號再次輸入框
          margin: EdgeInsets.only(top: 15),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty){
                return "帳號不能為空";
              }
              if (value != _firstController.text){
                return "輸入帳號必須相同";
              }
              return null;
            },
            controller: _secondController,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: "再次輸入帳號",
              contentPadding: EdgeInsets.fromLTRB(20,0,0,0),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              textBaseline: TextBaseline.alphabetic,
              height: 1.0
            ),
            maxLines: 1,
            autocorrect: false, // 自動糾正
            obscureText: false, // 隱藏輸入
          ),
        ),
        
        Container( // 確定重置密碼按鈕
          margin: EdgeInsets.only(top: 15),
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: TextButton(
            onPressed: () {
              if(formKey.currentState!.validate()){ // 導引重置密碼
                _handleResetPassword();
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue[900],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            child: Text(
              "重置我的密碼",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16,
                textBaseline: TextBaseline.alphabetic,
                height: 1.0
              ),
            ),
          ),
        ),
      ])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
        title: Text(
          "重置密碼",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        // actions: actions,
      ),
      body: Center(
        child: _buildInputForm(),
      ),
    );
  }
}