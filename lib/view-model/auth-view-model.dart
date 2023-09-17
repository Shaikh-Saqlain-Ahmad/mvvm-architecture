import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/model/user-model.dart';
import 'package:mvvm_architecture/repository/auth-repository.dart';
import 'package:mvvm_architecture/utils/routes/routes-name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view-model/user-view-model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signuploading = false;
  bool get singuploading => _signuploading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setsignupLoading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.loginApi(data).then((value) {
      if (kDebugMode) {
        setLoading(false);
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference.saveUser(UserModel(token: value['token'].toString()));
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

  Future<void> registerApi(dynamic data, BuildContext context) async {
    setsignupLoading(true);
    _myrepo.registerApi(data).then((value) {
      if (kDebugMode) {
        setsignupLoading(false);
        Utils.toastmessage("Sign up successful");
        print(value.toString());
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setsignupLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
