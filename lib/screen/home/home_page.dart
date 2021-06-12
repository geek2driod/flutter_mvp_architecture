import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvp_skeleton/export.dart';
import 'package:mvp_skeleton/screen/capture/capture_page.dart';
import 'package:mvp_skeleton/screen/home/home_contract.dart';
import 'package:mvp_skeleton/screen/library/export.dart';
import 'package:mvp_skeleton/widgets/platform_tab_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomePresenter>
    with SingleTickerProviderStateMixin, HomeView {
  TabController tabController;
  int selectedPosition = 0;

  List<Widget> tabPages = [
    CapturePage(),
    LibraryPage(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );

    presenter.attachView(this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    attachListener();
    return PlatformScaffold(
      backgroundColor: Color(0xFFEAEAF5),
      appBar: _appBar(),
      body: Container(
        width: double.infinity,
        child: _body(),
      ),
    );
  }

  PlatformAppBar _appBar() => PlatformAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colors.primaryDark,
        title: IntrinsicWidth(
          child: Row(
            children: [
              Hero(
                tag: 'appLogo',
                child: SvgPicture.asset(
                  assets.logo,
                  color: colors.almostWhite,
                  height: sizes.heightRatio * 20,
                ),
              ),
              horizontalSpace(8),
              Hero(
                tag: 'appName',
                child: Text(
                  'envision',
                  style: textStyles.boldManrope
                      .copyWith(color: colors.almostWhite),
                ),
              ),
            ],
          ),
        ),
      );

  Column _body() => Column(
        children: [
          Container(
            color: colors.primaryDark,
            child: _platformTabBar(),
          ),
          Expanded(
            child: tabPages[selectedPosition],
          ),
        ],
      );

  PlatformTabBar _platformTabBar() => PlatformTabBar(
        tabController: tabController,
        onTap: (position) {
          selectedPosition = position;
          setState(() {});
        },
        materialTabs: [
          Tab(
            child: AnimatedOpacity(
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              opacity: tabController.index == 0 ? 1.0 : 0.5,
              child: Text(
                'CAPTURE',
                style: textStyles.extraBoldManrope.copyWith(
                  color: colors.almostWhite,
                  fontSize: sizes.fontRatio * 14,
                ),
              ),
            ),
          ),
          Tab(
            child: AnimatedOpacity(
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              opacity: tabController.index == 1 ? 1.0 : 0.5,
              child: Text(
                'LIBRARY',
                style: textStyles.extraBoldManrope.copyWith(
                  color: colors.almostWhite,
                  fontSize: sizes.fontRatio * 14,
                ),
              ),
            ),
          ),
        ],
        cupertinoTabs: [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            title: AnimatedOpacity(
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              opacity: selectedPosition == 0 ? 1.0 : 0.5,
              child: Text(
                'CAPTURE',
                style: textStyles.extraBoldManrope.copyWith(
                  color: colors.almostWhite,
                  fontSize: sizes.fontRatio * 14,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            title: AnimatedOpacity(
              duration: Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              opacity: selectedPosition == 1 ? 1.0 : 0.5,
              child: Text(
                'LIBRARY',
                style: textStyles.extraBoldManrope.copyWith(
                  color: colors.almostWhite,
                  fontSize: sizes.fontRatio * 14,
                ),
              ),
            ),
          ),
        ],
      );

  void changeTab(int position) => setState(() {
    tabController.index = position;
    selectedPosition = position;
  });
}
