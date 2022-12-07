// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadImageMobx on _UploadImageMobx, Store {
  late final _$imageAtom =
      Atom(name: '_UploadImageMobx.image', context: context);

  @override
  XFile? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(XFile? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$getImageAsyncAction =
      AsyncAction('_UploadImageMobx.getImage', context: context);

  @override
  Future getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  late final _$checkCameraPermissionAsyncAction =
      AsyncAction('_UploadImageMobx.checkCameraPermission', context: context);

  @override
  Future<void> checkCameraPermission() {
    return _$checkCameraPermissionAsyncAction
        .run(() => super.checkCameraPermission());
  }

  @override
  String toString() {
    return '''
image: ${image}
    ''';
  }
}
