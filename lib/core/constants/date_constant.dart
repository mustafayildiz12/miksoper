import 'package:intl/intl.dart';

class TakeTime {
  String formatDate(DateTime now) {
    return DateFormat('dd-MM-yyyy').format(now);
  }
}
