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

String validateName(String value) {
  if (value.isEmpty && value.length == 0) {
    return "Name can't be empty";
  } else {
    return null;
  }
}

String validatePhoneNumber(String value) {
  if (value.isEmpty && value.length == 0) {
    return "Phone number can't be empty";
  } else if (value.length < 9) {
    return "Phone number is not correct format";
  } else {
    return null;
  }
}
