import 'package:flutter/material.dart';
import 'package:mvp_skeleton/export.dart';

class DocumentTextPreview extends StatelessWidget {
  final Function onSaveTap;
  final String documentText;

  DocumentTextPreview({
    @required this.onSaveTap,
    @required this.documentText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colors.primaryDark,
            colors.primaryDark,
            colors.primaryLight,
          ],
        ),
      ),
      child: Stack(
        children: [
          _textualData(),
          _saveButton(),
        ],
      ),
    );
  }

  Widget _textualData() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AspectRatio(
        aspectRatio: 0.6,
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: colors.almostWhite,
          ),
          child: Text(
            documentText,
          ),
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Align(
      alignment: FractionalOffset(
        0.5,
        0.9,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size(
            sizes.width * 0.6,
            verticalValue(40),
          ),
          backgroundColor: colors.primaryDark,
          padding: EdgeInsets.all(0),
        ),
        onPressed: onSaveTap,
        child: Text(
          'SAVE TEXT TO LIBRARY',
          style: textStyles.regularManrope.copyWith(
            color: colors.almostWhite,
          ),
        ),
      ),
    );
  }
}
