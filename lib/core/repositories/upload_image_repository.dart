import 'package:image_picker/image_picker.dart';

abstract class IUploadImage {
  Future<XFile?> galleryImage();
  Future<XFile?> cameraImage();
  Future<XFile?> galleryVideo();
  Future<XFile?> cameraVideo();
}

class UploadImage implements IUploadImage {
  final _picker = ImagePicker();
  @override
  Future<XFile?> cameraImage() async {
    return _picker.pickImage(source: ImageSource.camera);
  }

  @override
  Future<XFile?> galleryImage() async {
    return _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Future<XFile?> galleryVideo() {
    // TODO: implement video
    return _picker.pickVideo(source: ImageSource.gallery);
  }

  @override
  Future<XFile?> cameraVideo() {
    // TODO: implement cameraVideo
    return _picker.pickVideo(source: ImageSource.camera);
  }
}
