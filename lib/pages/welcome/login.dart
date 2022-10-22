import 'package:flutter/material.dart';
import 'package:myapp/common/models/models.dart';
import 'package:myapp/common/utils/utils.dart';
import 'package:myapp/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // 表單的Key
  final formKey = GlobalKey<FormState>();
  final _accountController = TextEditingController();
  final _passController = TextEditingController();

  _handleLogin() async {
    User? user = await DatabaseUtil().userLoginRequest(_accountController.text,cryptoSHA(_passController.text));
    
    // 登入失敗
    if(user == null){ 
      final snackbar = SnackBar(content: Text("登入失敗，帳號或密碼錯誤"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    // 成功登入
    Global.saveProfile(user);
    print(Global.profile);
    // 去除前面所有route 並跳轉到app頁面
    final snackbar = SnackBar(content: Text("登入成功，${user.name}你好！"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.of(context).pushNamedAndRemoveUntil('/app', (Route<dynamic> route) => false);

  }

  // logo
  Widget _buildLogo() {
    return Container(
    width: 110,
    margin: EdgeInsets.only(top: 120),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100,
          width: 100,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/images/boat_flat_design.jpg"),
          )
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            "船名",
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

  // 登入表單 + 登入按鈕
  Widget _buildInputForm() {
    return Container(
      width: 300,
      height: 204,
      margin: EdgeInsets.only(top: 30),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(children: [
        Container( // 帳號輸入框
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
            controller: _accountController,
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
        Container( // 密碼輸入框
          margin: EdgeInsets.only(top: 15),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty || value.length < 6){ return "密碼長度至少6位";}
              return null;
            },
            controller: _passController,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.top
            ,
            decoration: InputDecoration(
              hintText: "密碼",
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
            obscureText: true, // 隱藏輸入
          ),
        ),
        Container( // 登入按鈕
          margin: EdgeInsets.only(top: 15),
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: TextButton(
            onPressed: () {
              if(formKey.currentState!.validate()){ // 如果檢查資料成功，導引登入
                _handleLogin();
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue[900],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            child: Text(
              "登入",
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

  // 忘記密碼按鈕
  Widget _buildForgetButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: 300,
      height: 50,
      child: OutlinedButton(
        onPressed: (() {
          Navigator.pushNamed(context, "/forgot"); // 導航至忘記密碼重設頁面
          print("navigate to forget password");
        }),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
        child: Text(
          "忘記密碼",
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.normal,
            fontSize: 16,
            textBaseline: TextBaseline.alphabetic,
            height: 1.0
          ),
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
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildForgetButton(),
          ],
        ),
      ),
    );
  }
}