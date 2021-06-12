import 'package:flutter/material.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:mvp_skeleton/export.dart';

class LiveCameraView extends StatelessWidget {
  final CameraController controller;
  final Function onCaptureTap;

  LiveCameraView({
    @required this.controller,
    @required this.onCaptureTap,
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
          _cameraPreview(),
          _captureButton(),
        ],
      ),
    );
  }

  Widget _cameraPreview() {
    return AspectRatio(
      aspectRatio: 0.6,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            16,
          ),
          child: CameraPreview(controller),
        ),
      ),
    );
  }

  Widget _captureButton() {
    return Align(
      alignment: FractionalOffset(
        0.5,
        0.9,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size(
            sizes.width * 0.4,
            verticalValue(40),
          ),
          backgroundColor: colors.primaryDark,
          padding: EdgeInsets.all(0),
        ),
        onPressed: onCaptureTap,
        child: Text(
          'Capture',
          style: textStyles.regularManrope.copyWith(
            color: colors.almostWhite,
          ),
        ),
      ),
    );
  }
}
