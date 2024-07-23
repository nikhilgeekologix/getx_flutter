import 'package:getx_example/data/network/neteork_api_service.dart';
import 'package:getx_example/models/home_userlist_model/userlist_model.dart';
import 'package:getx_example/res/app_url/app_url.dart';

class UserListRepository {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi(int value) async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.usersListApi}?page=$value");
    return UserListModel.fromJson(response);
  }
}
