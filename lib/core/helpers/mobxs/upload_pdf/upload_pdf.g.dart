// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_pdf.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadPdf on _UploadPdf, Store {
  late final _$resultAtom = Atom(name: '_UploadPdf.result', context: context);

  @override
  FilePickerResult? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(FilePickerResult? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$pickFileAsyncAction =
      AsyncAction('_UploadPdf.pickFile', context: context);

  @override
  Future pickFile(BuildContext context) {
    return _$pickFileAsyncAction.run(() => super.pickFile(context));
  }

  @override
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
