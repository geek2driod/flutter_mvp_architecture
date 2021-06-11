import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:mvp_skeleton/export.dart';
import 'package:mvp_skeleton/main.dart';
import 'package:path_provider/path_provider.dart';

class CapturePage extends StatefulWidget {
  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends BaseState<CapturePage, CapturePresenter>
    with CaptureView {
  CameraController controller;
  File image;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) async {
      await controller.setFlashMode(FlashMode.off);

      if (!mounted) {
        return;
      }
      setState(() {});
    });

    presenter.attachView(this);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

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
          image==null?SizedBox.shrink():_picturePreview(),
          presenter.getDocumentText()!=null || presenter.getDocumentText().isNotEmpty ?_textualData():SizedBox.shrink(),
          presenter.getDocumentText()!=null || presenter.getDocumentText().isNotEmpty ?_saveButton():loading?SizedBox.shrink():_captureButton(),
          loading?_loading():SizedBox.shrink(),
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

  Widget _textualData(){
    return AspectRatio(
      aspectRatio: 0.6,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colors.almostWhite,

        ),

        child: Text(
          presenter.getDocumentText(),
        ),
      ),
    );
  }

  void _handleCaptureButton() async {
    if (controller == null || !controller.value.isInitialized) {
      // A capture is already pending, do nothing.
      return null;
    }

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/$timestamp.jpg';

    try {
      await controller.takePicture(filePath).then((file) {
        image = File(filePath);
        presenter.readDocument(image);
        setState(() {});
      });
    } on CameraException catch (e) {
      return null;
    }
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
        onPressed: _handleCaptureButton,
        child: Text(
          'Capture',
          style: textStyles.regularManrope.copyWith(
            color: colors.almostWhite,
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
        onPressed: presenter.onSaveTap,
        child: Text(
          'SAVE TEXT TO LIBRARY',
          style: textStyles.regularManrope.copyWith(
            color: colors.almostWhite,
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

  @override
  void showLoader() {
    loading = true;
    setState(() {});
  }

  @override
  void hideLoader() {
    loading = false;
    image = null;
    setState(() {});
  }
}
