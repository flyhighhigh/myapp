import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/global.dart';
import 'package:myapp/pages/application/application.dart';
import 'package:myapp/pages/application/selecttest.dart';
import 'package:myapp/pages/welcome/login.dart';
import 'package:myapp/pages/welcome/welcome.dart';
import 'package:myapp/routes.dart';

void main() {
  Global.init().then( (e) => runApp(const MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,  
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('zh','TW'),
        Locale('en','US')
      ],
      locale: Locale('zh','TW'),
      title: '漁工勤務紀錄',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        brightness: Brightness.light
      ),
      routes: staticRoutes,
      home: Global.alreadyOpen == false
          ? WelcomePage()
          : ( Global.profile == null ? LoginPage() : ApplicationPage() ),
      // home: SelectTestPage(),
    );
  }

}
