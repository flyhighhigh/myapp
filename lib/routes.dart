import 'package:myapp/pages/application/application.dart';
import 'package:myapp/pages/application/useredit.dart';
import 'package:myapp/pages/welcome/forgot.dart';
import 'package:myapp/pages/welcome/login.dart';

/// 靜態路由
var staticRoutes = {
  "/login": (context) => LoginPage(), // Login登入
  "/forgot": (context) => ForgotPage(), // 忘記密碼
  "/app": (context) => ApplicationPage(), // 主頁面
};