import 'package:flutter/material.dart';

import '../export.dart';

Assets assets;
AppColors colors;
AppConstant constant;
AppSizes sizes;
Styles textStyles;
AppWidgets widgets;

void initializeAppResources({@required context}) {
  sizes = AppSizes();
  sizes.initializeSize(context);
  assets = Assets();
  colors = AppColors();
  constant = AppConstant();
  textStyles = Styles();
  widgets = AppWidgets();
}
