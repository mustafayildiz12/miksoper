// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_video.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadVideo on _UploadVideo, Store {
  late final _$imageFileListAtom =
      Atom(name: '_UploadVideo.imageFileList', context: context);

  @override
  List<XFile>? get imageFileList {
    _$imageFileListAtom.reportRead();
    return super.imageFileList;
  }

  @override
  set imageFileList(List<XFile>? value) {
    _$imageFileListAtom.reportWrite(value, super.imageFileList, () {
      super.imageFileList = value;
    });
  }

  late final _$playVideoAsyncAction =
      AsyncAction('_UploadVideo.playVideo', context: context);

  @override
  Future<void> playVideo(XFile? file) {
    return _$playVideoAsyncAction.run(() => super.playVideo(file));
  }

  late final _$onImageButtonPressedAsyncAction =
      AsyncAction('_UploadVideo.onImageButtonPressed', context: context);

  @override
  Future<void> onImageButtonPressed(ImageSource source) {
    return _$onImageButtonPressedAsyncAction
        .run(() => super.onImageButtonPressed(source));
  }

  late final _$disposeVideoControllerAsyncAction =
      AsyncAction('_UploadVideo.disposeVideoController', context: context);

  @override
  Future<void> disposeVideoController() {
    return _$disposeVideoControllerAsyncAction
        .run(() => super.disposeVideoController());
  }

  late final _$retrieveLostDataAsyncAction =
      AsyncAction('_UploadVideo.retrieveLostData', context: context);

  @override
  Future<void> retrieveLostData() {
    return _$retrieveLostDataAsyncAction.run(() => super.retrieveLostData());
  }

  @override
  String toString() {
    return '''
imageFileList: ${imageFileList}
    ''';
  }
}
