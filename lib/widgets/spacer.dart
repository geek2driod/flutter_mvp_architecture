import 'package:mvp_skeleton/export.dart';

Widget verticalSpace(double value) => SizedBox(
      height: value * sizes.heightRatio,
    );

Widget horizontalSpace(double value) => SizedBox(
      width: value * sizes.widthRatio,
    );

double verticalValue(double value) => value * sizes.heightRatio;

double horizontalValue(double value) => value * sizes.widthRatio;
