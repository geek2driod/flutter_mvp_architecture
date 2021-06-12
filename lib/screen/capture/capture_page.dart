import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:mvp_skeleton/export.dart';
import 'package:mvp_skeleton/main.dart';
import 'package:mvp_skeleton/screen/capture/widgets/document_text_preview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

enum CapturePageViewType {
  CAMERA_IS_NOT_READY,
  CAMERA_PREVIEW,
  IMAGE_PREVIEW,
  DOCUMENT_TEXT,
}

class CapturePage extends StatefulWidget {

  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends BaseState<CapturePage, CapturePresenter>
    with CaptureView {
  CapturePageViewType viewType = CapturePageViewType.CAMERA_PREVIEW;
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
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (viewType) {
      case CapturePageViewType.CAMERA_IS_NOT_READY:
        return CameraNotReady();
      case CapturePageViewType.CAMERA_PREVIEW:
        return LiveCameraView(
          controller: controller,
          onCaptureTap: _onCaptureTap,
        );
      case CapturePageViewType.IMAGE_PREVIEW:
        return ImagePreview(
          image: image,
        );
      case CapturePageViewType.DOCUMENT_TEXT:
        return DocumentTextPreview(
          onSaveTap: (){
            presenter.onSaveTap();
            final homePresenter = Provider.of<HomePresenter>(context, listen: false);
            homePresenter.onSaveDocumentTextTap();
          },
          documentText: presenter.getDocumentText(),
        );
    }
  }

  void _onCaptureTap() async {
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
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void showDocumentView() => setState(() {
        viewType = CapturePageViewType.DOCUMENT_TEXT;
      });

  @override
  void showImagePreview() => setState(() {
    viewType = CapturePageViewType.IMAGE_PREVIEW;
  });

  @override
  void showLiveCameraView() => setState(() {
    viewType = CapturePageViewType.CAMERA_PREVIEW;
  });
}
