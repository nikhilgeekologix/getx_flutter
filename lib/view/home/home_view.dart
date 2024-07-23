import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/data/response/status.dart';
import 'package:getx_example/view/login/login_view.dart';
import 'package:getx_example/view_models/controller/home/userlist_view_model.dart';

import '../../view_models/controller/login/user_prefrence/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.put(UserListViewModel());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    homeVM.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Center(
            child: Text(
          'Home View',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Obx(() {
        switch (homeVM.rxRequestStatus.value) {
          case Status.LOADING:
            return Visibility(
                visible: !homeVM.isFetchingMore.value,
                child: Center(child: CircularProgressIndicator()));

          case Status.ERROR:
            return Center(child: Text("Something went wrong"));

          case Status.COMPLETED:
            return Stack(children: [
              ListView.builder(
                  controller: homeVM.scrollController,
                  itemCount: homeVM.userList.value.data?.length,
                  itemBuilder: (context, index) {
                    var model = homeVM.userList.value.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.lightBlue, // Border color
                            width: 2, // Border width
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 80,
                                    backgroundImage:
                                        NetworkImage(model.avatar.toString()),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "User Name : ${model.firstName} ${model.lastName}",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "Email : ${model.email.toString()}",
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              homeVM.isFetchingMore.value
                  ? Positioned(
                      height: 30,
                      bottom: 20,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox.shrink(),
            ]);
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userPreference.removeUser();
          Get.offAll(LoginView());
        },
        child: Icon(Icons.logout),
        tooltip: 'Logout',
      ),
    );
  }
}
