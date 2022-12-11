import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/image_repository.dart';
import '../../../repositories/pick_manager.dart';

part 'upload_image.g.dart';

// ignore: library_private_types_in_public_api
class UploadImageMobx = _UploadImageMobx with _$UploadImageMobx;

abstract class _UploadImageMobx with Store {
  IPickManager pickManager = PickManager();
  IPermissionHandler permissionHandler = PermissionHandler();
  @observable
  XFile? image;
  bool isMediaAccessOkay = false;
  bool isPlaying = false;

  @action
  getImage() async {
    var newImage = await pickManager.fetchCamereImage();
    image = newImage!.file;
  }

  @action
  Future<void> checkCameraPermission() async {
    isMediaAccessOkay = await permissionHandler.checkCamera();
    print('MediaOkey: $isMediaAccessOkay');
  }
  
}
