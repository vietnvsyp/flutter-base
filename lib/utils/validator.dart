abstract class Validator {
  bool validation(String? text);
}

class PasswordValidator implements Validator {
  @override
  bool validation(String? text) {
    if (text == null) {
      return false;
    }
    return _validateLowerCase(text) &&
        _validateUpperCase(text) &&
        _validateSpecialCharacter(text) &&
        _validateNumber(text) &&
        _validateLength(text);
  }

  bool _validateLowerCase(String value) {
    String pattern = r'^(?=.*?[a-z])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _validateUpperCase(String value) {
    String pattern = r'^(?=.*?[A-Z])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _validateSpecialCharacter(String value) {
    String pattern = r'[-_~!@#$%^&*(),.?":{}|<>]';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _validateNumber(String value) {
    String pattern = r'^(?=.*?[0-9])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _validateLength(String value) {
    String pattern = r'^.{10,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

class EmailValidator implements Validator {
  @override
  bool validation(String? text) {
    if (text == null) {
      return false;
    }
    return _isEmail(text);
  }

  bool _isEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email);
  }
}

class KanaValidator implements Validator {
  @override
  bool validation(String? text) {
    if (text == null) {
      return false;
    }
    return _isKana(text);
  }

  bool _isKana(String email) {
    String pattern = r'^[ァ-ンヴー]+$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email);
  }
}
