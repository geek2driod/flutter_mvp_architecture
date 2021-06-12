import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mvp_skeleton/export.dart';

class ImagePreview extends StatelessWidget {
  final File image;

  ImagePreview({
    this.image,
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
          _picturePreview(),
          _loading(),
        ],
      ),
    );
  }

  Widget _picturePreview() {
    return AspectRatio(
      aspectRatio: 0.6,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            16,
          ),
          child: Image.file(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _loading() {
    return Align(
      alignment: FractionalOffset(0.5, 0.5),
      child: IntrinsicWidth(
        child: Container(
          color: colors.primaryDark,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(16),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
              horizontalSpace(8),
              Text(
                'OCR in progress..',
                style: textStyles.regularManrope.copyWith(
                  color: colors.almostWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
