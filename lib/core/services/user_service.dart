import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';

@lazySingleton
class UserService {
  UserModel? _user;

  UserModel? get getUser {
    return _user;
  }

  set setUser(UserModel user) {
    _user = user;
  }

  bool get isMustResetPassword => _user?.mustResetPassword == true;
  bool get isAdmin => _user?.role == 'admin';
  bool get isSuperAdmin => _user?.role == 'super_admin';
  bool get isResearcher => _user?.role == 'researcher';
  bool get isSupervisor => _user?.role == 'supervisor';
  bool get isDataAnalyst => _user?.role == 'data_analyst';
}
