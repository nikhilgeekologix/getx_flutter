import 'package:getx_example/data/network/neteork_api_service.dart';
import 'package:getx_example/res/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.loginApi);
    return response;
  }
}
