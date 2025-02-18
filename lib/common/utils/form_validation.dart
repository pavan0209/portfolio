extension Validator on String {
  bool isInValidEmail() {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9]([a-zA-Z0-9_-]|(\.(?!\.)))+[a-zA-Z0-9]\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,})+$");
    return emailRegExp.hasMatch(this) ? false : true;
  }

  bool isInValidName() {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this) ? false : true;
  }
}