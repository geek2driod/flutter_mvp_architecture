import 'package:flutter/material.dart';
import 'package:mvp_skeleton/export.dart';

class EmptyLibrary extends StatelessWidget {

  final Function onTryNowTap;

  EmptyLibrary({this.onTryNowTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalValue(70),
            ),
            child: Text(
              'Oh you don\'t have anything in your library!',
              style: textStyles.boldManrope.copyWith(
                color: colors.secondary900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(16),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(
                sizes.width * 0.4,
                verticalValue(40),
              ),
              backgroundColor: colors.primaryDark,
              padding: EdgeInsets.all(0),
            ),
            onPressed: onTryNowTap,
            child: Text(
              'Try now',
              style: textStyles.regularManrope.copyWith(
                color: colors.almostWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
