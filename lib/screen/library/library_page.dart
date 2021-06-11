import 'package:mvp_skeleton/export.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.almostWhite,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Library Page',
            style: textStyles.boldManrope.copyWith(
              color: colors.primaryDark,
              fontSize: sizes.fontRatio*22,
            ),
          ),
        ],
      ),
    );
  }
}
