import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionHandler {
  Future<bool> checkCamera();
  Future<bool> checkMedia();
}

class PermissionHandler implements IPermissionHandler {
  @override
  Future<bool> checkCamera() async {
    final status = await Permission.camera.status;

    return status.isGranted;
  }

  @override
  Future<bool> checkMedia() async {
    final status = await Permission.mediaLibrary.status;

    return status.isGranted;
  }
}
