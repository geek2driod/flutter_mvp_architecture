import '../../../export.dart';

class LibraryItem extends StatelessWidget {
  LibraryItem(this.timeStamp);

  final String timeStamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
        vertical: verticalValue(16),
      ),
      child: Text(
        '$timeStamp',
        style: textStyles.regularManrope.copyWith(
          color: colors.secondary900,
        ),
      ),
    );
  }
}
