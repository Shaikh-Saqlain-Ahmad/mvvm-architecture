import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/repository/auth-repository.dart';
import 'package:mvvm_architecture/utils/routes/routes-name.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.loginApi(data).then((value) {
      if (kDebugMode) {
        setLoading(false);
        Utils.toastmessage("Login successful");
        print(value.toString());
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
