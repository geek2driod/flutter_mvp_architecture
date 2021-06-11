import 'dart:io';
import '../export.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget> extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      return buildAndroid(context);
    } else if (Platform.isIOS) {
      return buildIOS(context);
    }

    return SizedBox.shrink();
  }

  I buildIOS(BuildContext context);

  A buildAndroid(BuildContext context);

}