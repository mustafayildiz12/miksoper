// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_video.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadVideo on _UploadVideo, Store {
  late final _$controllerAtom =
      Atom(name: '_UploadVideo.controller', context: context);

  @override
  VideoPlayerController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(VideoPlayerController? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$pickVideoAsyncAction =
      AsyncAction('_UploadVideo.pickVideo', context: context);

  @override
  Future pickVideo() {
    return _$pickVideoAsyncAction.run(() => super.pickVideo());
  }

  late final _$stopVideoAsyncAction =
      AsyncAction('_UploadVideo.stopVideo', context: context);

  @override
  Future stopVideo() {
    return _$stopVideoAsyncAction.run(() => super.stopVideo());
  }

  @override
  String toString() {
    return '''
controller: ${controller}
    ''';
  }
}
