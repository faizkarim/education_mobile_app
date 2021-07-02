import 'package:intl/intl.dart';

class AppDateTime {
  static getDateTime() {
    DateTime dateTime = DateTime.now();
    final DateFormat format = DateFormat('dd-MM-yyyy');
    return format.format(dateTime);
  }
}
