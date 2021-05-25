class NotEmptyString {
  NotEmptyString(this._value);

  final String? _value;

  String? value() {
    return (_value != null && _value!.isNotEmpty) ? _value : null;
  }
}
