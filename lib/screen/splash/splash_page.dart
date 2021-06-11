import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashPresenter>
    with SplashView {
  double leftPosition = -210.0;
  double topPosition = 60.0;
  double bottomPosition = 60.0;
  double rightPosition = -210.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
      milliseconds: 1000,
    )).then((value) {
      leftPosition = -110;
      setState(() {});
    });
    Future.delayed(Duration(
      milliseconds: 1200,
    )).then((value) {
      rightPosition = -110;
      setState(() {});
    });
    presenter.attachView(this);
    presenter.init();
  }

  @override
  Widget build(BuildContext context) {
    initializeAppResources(
      context: context,
    );
    return PlatformScaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.primaryDark,
              colors.primaryLight,
              colors.primaryDark,
            ],
          ),
        ),
        child: Stack(
          children: [
            _leftLogo(),
            _rightLogo(),
            _appName(),
          ],
        ),
      ),
    );
  }

  Widget _leftLogo() => AnimatedPositioned(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        left: leftPosition,
        top: topPosition,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 40,
                offset: Offset(
                  10.0,
                  10.0,
                ),
              ),
            ],
          ),
          child: SvgPicture.asset(
            assets.logo,
            color: colors.almostWhite,
            height: sizes.heightRatio * 200,
          ),
        ),
      );

  Widget _rightLogo() => AnimatedPositioned(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        right: rightPosition,
        bottom: bottomPosition,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 40,
                offset: Offset(
                  -10.0,
                  10.0,
                ),
              ),
            ],
          ),
          child: Hero(
            tag: 'appLogo',
            child: SvgPicture.asset(
              assets.logo,
              color: colors.almostWhite,
              height: sizes.heightRatio * 200,
            ),
          ),
        ),
      );

  Widget _appName() => Align(
        alignment: FractionalOffset(
          0.5,
          0.5,
        ),
        child: Hero(
          tag: 'appName',
          child: Text(
            'envision',
            style: textStyles.extraBoldManrope.copyWith(
              fontSize: sizes.fontRatio * 32,
              color: colors.almostWhite,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 4.0),
                  blurRadius: 10.0,
                  color: colors.primaryDark,
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      );

  @override
  void openHomePage() => Navigator.pushReplacementNamed(
        context,
        AppRoutes.homePage,
      );
}
