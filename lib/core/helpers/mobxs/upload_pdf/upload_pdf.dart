import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../ui/pages/tabs/profile/pdf_screen/pdf_screen.dart';

part 'upload_pdf.g.dart';

// ignore: library_private_types_in_public_api
class UploadPdf = _UploadPdf with _$UploadPdf;

abstract class _UploadPdf with Store {
  @observable
  FilePickerResult? result;
  PlatformFile? pickedFile;
  String? fileName;
  bool isLoading = false;
  File? displayFile;

  @action
  pickFile(BuildContext context) async {
    try {
      isLoading = true;
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;

        displayFile = File(pickedFile!.path.toString());

        // ignore: use_build_context_synchronously
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfScreen(
              path: displayFile!.path,
              fileName: fileName!,
            ),
          ),
        );
      }
      isLoading = false;
    } catch (e) {
      print(e.toString());
    }
  }
}
