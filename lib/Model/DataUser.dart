class DataUser {
  static final DataUser _instance = DataUser._internal();

  factory DataUser() {
    return _instance;
  }

  DataUser._internal();

  String name = '';
  String email = '';
  String adminClassName = '';
  String adminStudentName = '';
}
