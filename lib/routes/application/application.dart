import 'package:flutter/material.dart';
import 'package:turn_page/common/utils/iconfont.dart';
import 'package:turn_page/common/utils/screen.dart';
import 'package:turn_page/common/values/colors.dart';
import 'package:turn_page/routes/account/account.dart';
import 'package:turn_page/routes/bookmarks/Bookmarks.dart';
import 'package:turn_page/routes/category/category.dart';
import 'package:turn_page/routes/main/mian.dart';
import 'package:turn_page/widgets/app.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 当前tab页码
  int _page = 0;
  // tab页标题
  final List<String> _tabTitles = [
    'Welcome',
    'Cagetory',
    'Boolmarks',
    'Account',
  ];

  // 底部导航item
  final List<BottomNavigationBarItem> _bottomItems = <BottomNavigationBarItem>[
    _buildBottomNavitem(Iconfont.home, "main"),
    _buildBottomNavitem(Iconfont.grid, "category"),
    _buildBottomNavitem(Iconfont.tag, "tag"),
    _buildBottomNavitem(Iconfont.me, "my"),
  ];

  // 页控制器
  PageController _pageController;

  // tab栏动画
  _handleNavBarTap(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 100), curve: Curves.easeInCubic);
  }

  // 页码切换
  _handlePageChange(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static BottomNavigationBarItem _buildBottomNavitem(
      IconData icon, String title) {
    return new BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        icon,
        color: AppColors.secondaryElementText,
      ),
      title: Text(title),
      backgroundColor: AppColors.primaryBackground,
    );
  }

  // 标题栏
  Widget _buildAppBar() {
    return transparentAppbar(
      context: context,
      showBack: false,
      titleView: Center(
        child: Text(
          _tabTitles[_page],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {})
      ],
    );
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: _handlePageChange,
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookmarksPage(),
        AccountPage(),
      ],
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomItems,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
