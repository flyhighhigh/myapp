import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  Widget _buildHeadTitle() { // 歡迎頁面標題
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: Text(
        "歡迎頁面標題",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildHeadDetail() { // 歡迎頁面介紹
    return Container(
      width: 240,
      margin: EdgeInsets.only(top: 30),
      child: Text(
        """這是歡迎頁面介紹
我不知道可以打什麼耶耶依耶。

後視鏡裡的世界 越來越遠的道別
妳轉身向背 側臉還是很美
我用眼光去追 竟聽見妳的淚
在車窗外面徘徊 是我錯失的機會
你站的方位 跟我中間隔著淚
街景一直在後退
妳的崩潰在窗外零碎
我一路向北 離開有妳的季節
妳說妳好累 已無法再愛上誰
風在山路吹 過往的畫面全都是我不對
細數慚愧 我傷妳幾回

我一路向北 離開有妳的季節
方向盤周圍 迴轉著我的後悔
我加速超越 卻甩不掉緊緊跟隨的傷悲
細數慚愧 我傷妳幾回
停止狼狽 就讓錯純粹""",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildStartButton() { // 歡迎頁面開始button
    return Container(
      width: 300,
      height: 45,
      margin: EdgeInsets.only(bottom: 30),
      child: TextButton(
        onPressed: (() {
          Navigator.pushNamed(context, "/login"); // 導航至LoginPage
        }),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center

        ),
        child: Text(
          "開始使用",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            textBaseline: TextBaseline.alphabetic,
            height: 1.0
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildHeadTitle(),
            _buildHeadDetail(),
            Spacer(),
            _buildStartButton()
          ],
        )
      ),
    );
  }
}
