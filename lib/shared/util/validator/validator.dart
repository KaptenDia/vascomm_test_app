class Validator {
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return "Form wajib diisi";
    }
    return null;
  }

  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value == null) {
      return "Form wajib diisi";
    }

    if (value is String || value == null) {
      if (value.toString() == "null") return "Form wajib diisi";
      if (value.isEmpty) return "Form wajib diisi";
    }

    if (value is List) {
      if (value.isEmpty) return "Form wajib diisi";
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return "Form wajib diisi";

    final bool isValidEmail = RegExp(
            "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(value);

    if (!isValidEmail) {
      return "Format email tidak valid !";
    }
    return null;
  }

  static String? number(String? value) {
    if (value!.isEmpty) return "Form wajib diisi";

    final bool isNumber = RegExp(r"^[0-9]+$").hasMatch(value);
    if (!isNumber) {
      return "Nomor tidak valid!";
    }
    return null;
  }

  static String? atLeastOneitem(List<Map<String, dynamic>> items) {
    var checkedItems = items.where((i) => i["checked"] == true).toList();
    if (checkedItems.isEmpty) {
      return "you must choose at least one item";
    }
    return null;
  }
}
