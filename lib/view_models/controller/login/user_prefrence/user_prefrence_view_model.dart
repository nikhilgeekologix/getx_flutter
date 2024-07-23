import 'package:getx_example/models/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(LoginResponseModel loginResponseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', loginResponseModel.token.toString());
    return true;
  }

  Future<LoginResponseModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return LoginResponseModel(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
