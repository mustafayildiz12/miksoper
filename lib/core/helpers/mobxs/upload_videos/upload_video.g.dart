// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_video.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadVideo on _UploadVideo, Store {
  late final _$isMediaAccessOkayAtom =
      Atom(name: '_UploadVideo.isMediaAccessOkay', context: context);

  @override
  bool? get isMediaAccessOkay {
    _$isMediaAccessOkayAtom.reportRead();
    return super.isMediaAccessOkay;
  }

  @override
  set isMediaAccessOkay(bool? value) {
    _$isMediaAccessOkayAtom.reportWrite(value, super.isMediaAccessOkay, () {
      super.isMediaAccessOkay = value;
    });
  }

  late final _$videoAtom = Atom(name: '_UploadVideo.video', context: context);

  @override
  File? get video {
    _$videoAtom.reportRead();
    return super.video;
  }

  @override
  set video(File? value) {
    _$videoAtom.reportWrite(value, super.video, () {
      super.video = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: '_UploadVideo.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$videoPlayerControllerAtom =
      Atom(name: '_UploadVideo.videoPlayerController', context: context);

  @override
  VideoPlayerController? get videoPlayerController {
    _$videoPlayerControllerAtom.reportRead();
    return super.videoPlayerController;
  }

  @override
  set videoPlayerController(VideoPlayerController? value) {
    _$videoPlayerControllerAtom.reportWrite(value, super.videoPlayerController,
        () {
      super.videoPlayerController = value;
    });
  }

  late final _$pickVideoAsyncAction =
      AsyncAction('_UploadVideo.pickVideo', context: context);

  @override
  Future<dynamic> pickVideo() {
    return _$pickVideoAsyncAction.run(() => super.pickVideo());
  }

  late final _$checkVideoPermissionAsyncAction =
      AsyncAction('_UploadVideo.checkVideoPermission', context: context);

  @override
  Future<void> checkVideoPermission() {
    return _$checkVideoPermissionAsyncAction
        .run(() => super.checkVideoPermission());
  }

  late final _$_UploadVideoActionController =
      ActionController(name: '_UploadVideo', context: context);

  @override
  dynamic playOrPause() {
    final _$actionInfo = _$_UploadVideoActionController.startAction(
        name: '_UploadVideo.playOrPause');
    try {
      return super.playOrPause();
    } finally {
      _$_UploadVideoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isMediaAccessOkay: ${isMediaAccessOkay},
video: ${video},
isPlaying: ${isPlaying},
videoPlayerController: ${videoPlayerController}
    ''';
  }
}
