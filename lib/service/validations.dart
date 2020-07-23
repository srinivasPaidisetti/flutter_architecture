String validateEmailAddress(String value) {
  if (value.isEmpty && value.length == 0) {
    return "Email can't be empty";
  } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Invalid Email';
  } else {
    return null;
  }
}

String validatePassword(String value) {
  if (value.length == 0) {
    return "Password can't be empty";
  } else if (value.length < 6) {
    return "Password length at least 6 characters";
  } else {
    return null;
  }
}
