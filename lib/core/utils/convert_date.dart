import 'package:intl/intl.dart';

class ConvertDate {
  static String convertDate(String date) {
    var dateParse = DateTime.parse(date).toLocal();
    var formattedDate = DateFormat('dd MMM yyyy').format(dateParse);
    return formattedDate;
  }
}