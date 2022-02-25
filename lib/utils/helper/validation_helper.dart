class ValidationHelper {
  ValidationHelper._();

  static String? validateTextField(String? val) {
    if ((val?.length ?? 0) == 0) {
      return "Field cant be empty";
    } else {
      return null;
    }
  }
}
