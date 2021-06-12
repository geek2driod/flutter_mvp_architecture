import 'package:mvp_skeleton/export.dart';

class CameraNotReady extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        'Camera is not ready!',
        style: textStyles.regularManrope.copyWith(
          color: colors.accentSecondary,
        ),
      ),
    );
  }
}
