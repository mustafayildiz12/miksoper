import 'package:flutter/cupertino.dart';

class CommentProvider extends ChangeNotifier {
  String postValue = '';
  String commentValue = '';
  bool isExpanded = false;

  notify() {
    notifyListeners();
  }
}
