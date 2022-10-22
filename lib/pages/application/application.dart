import 'package:flutter/material.dart';
import 'package:myapp/pages/application/dashboard.dart';
import 'package:myapp/pages/application/employee.dart';
import 'package:myapp/pages/application/logs.dart';
import 'package:myapp/pages/application/settings.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 頁碼
  int _page = 0;
  // 標題
  final List<String> _tabTitles = [
    '勤務紀錄',
    '船員管理',
    '修改日誌',
    '設定'
  ];
  // 頁面控制器
  PageController? _pageController;

  // 底部導航列項目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.dashboard,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        Icons.dashboard,
        color: Colors.blue[900],
      ),
      label: 'dashboard',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.people,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        Icons.people,
        color: Colors.blue[900],
      ),
      label: 'employees',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.notes,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        Icons.notes,
        color: Colors.blue[900],
      ),
      label: 'logs',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.manage_accounts,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        Icons.manage_accounts,
        color: Colors.blue[900],
      ),
      label: 'settings',
      backgroundColor: Colors.white,
    ),
  ];

  // tab欄動畫
  void _handleNavBarTap(int index) {
    _pageController?.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab欄頁碼切換
  void _handlePageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  // 内容頁
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        DashboardPage(),
        EmployeePage(),
        LogsPage(),
        SettingsPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // 底部島航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, // 取消返回鍵
        // centerTitle: true, // 置中
        leading: Icon(Icons.directions_boat,color: Colors.black,),
        title: Text(
          _tabTitles[_page],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 0,
      ),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
