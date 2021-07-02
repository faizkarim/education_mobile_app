import 'package:get/get_utils/src/get_utils/get_utils.dart';

class AppValidation {
  emptyValidation(String value, String inputField) {
    return value.isEmpty
        ? "$inputField field cannot be empty"
        : null;
  }

  emailValidation(String value) {
    if (GetUtils.isNullOrBlank(value)) {
      return "Email field cannot be empty";
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid email format";
    } else {
      return null;
    }
  }
}
