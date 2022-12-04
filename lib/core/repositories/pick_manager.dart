import 'package:app_settings/app_settings.dart';
import 'package:image_picker/image_picker.dart';

import 'image_repository.dart';
import 'upload_image_repository.dart';

abstract class IPickManager {
  final IUploadImage _iUploadImage = UploadImage();
  final IPermissionHandler _iPermissionHandler = PermissionHandler();

  Future<PermissionModel?> fetchCamereImage();
  Future<PermissionModel?> fetchStorageImage();
  Future<PermissionModel?> fetchStorageVideo();
  Future<PermissionModel?> fetchCameraVideo();
}

class PickManager extends IPickManager {
  @override
  Future<PermissionModel?> fetchCamereImage() async {
    // ignore: unrelated_type_equality_checks
    if (!await _iPermissionHandler.checkCamera()) {
      await AppSettings.openAppSettings();

      return PermissionModel(null);
    }
    print('İzin alınmış');
    final model = await _iUploadImage.cameraImage();

    return PermissionModel(model, status: true);
  }

  @override
  Future<PermissionModel?> fetchStorageImage() async {
    if (!await _iPermissionHandler.checkMedia()) {
      await AppSettings.openAppSettings();

      return PermissionModel(null);
    }
    print('İzin alınmış');
    final model = await _iUploadImage.galleryImage();

    return PermissionModel(model, status: true);
  }

  @override
  Future<PermissionModel?> fetchStorageVideo() async {
    if (!await _iPermissionHandler.checkMedia()) {
      await AppSettings.openAppSettings();

      return PermissionModel(null);
    }
    print('İzin alınmış');
    final model = await _iUploadImage.galleryVideo();

    return PermissionModel(model, status: true);
  }

  @override
  Future<PermissionModel?> fetchCameraVideo() async {
    if (!await _iPermissionHandler.checkCamera()) {
      await AppSettings.openAppSettings();

      return PermissionModel(null);
    }
    print('İzin alınmış');
    final model = await _iUploadImage.cameraVideo();

    return PermissionModel(model, status: true);
  }
}

class PermissionModel {
  PermissionModel(this.file, {this.status = false});

  final XFile? file;
  final bool status;
}
