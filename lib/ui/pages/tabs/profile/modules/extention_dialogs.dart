part of '../profile.dart';
extension ProfileDialogExtension on _ProfileDialog {
  show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => this,
    );
  }
}

extension DocumentDialogExtension on _DocumentDialog {
  show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => this,
    );
  }
}

extension DocumentDialogUploadDoucmentExtension on _UploadDocumentDialog {
  show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => this,
    );
  }
}

extension DefectiveRecordDialogExtension on _DefectiveRecordDocumentDialog {
  show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => this,
    );
  }
}

extension MyFollowsDialogExtension on _MyFollowsDialog {
  show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => this,
    );
  }
}

extension SettingsDialogExtension on _AppSettings {
  show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => this,
    );
  }
}