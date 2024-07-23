import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_example/data/response/status.dart';
import 'package:getx_example/models/home_userlist_model/userlist_model.dart';

import '../../../repository/home_userlist/userlist_repository.dart';
import '../../../utils/utils.dart';

class UserListViewModel extends GetxController {
  final _api = UserListRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final isFetchingMore = false.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    fetchUserList();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchNextPage();
      }
    });
    super.onInit();
  }

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;

  void fetchUserList() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi(currentPage.value).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      if (currentPage.value == 1) {
        userList.value = value;
      } else {
        userList.value.data!.addAll(value.data!);
        userList.refresh();
      }
      totalPages.value = value.totalPages!;
      isFetchingMore.value = false;
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      isFetchingMore.value = false;
      print(error.toString());
    });
  }

  void fetchNextPage() {
    if (currentPage.value < totalPages.value) {
      isFetchingMore.value = true;
      currentPage.value++;
      fetchUserList();
    }
  }
}
