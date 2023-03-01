import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Constant/route_names.dart';
import 'package:musicapp/Views/Home/home_view.dart';

import 'home_controller.dart';

class RootController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt notiCount = 0.obs;


  List<Widget> pages = <Widget>[
    const HomeView(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  ///change page in route
  Future<void> changePageInRoot(int _index) async {
    currentIndex.value = _index;
    await refreshPage(_index);
  }

  Future<void> changePageOutRoot(int _index) async {
    currentIndex.value = _index;
    await refreshPage(_index);
    await Get.offNamedUntil(root, (Route route) {
      if (route.settings.name == root) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  Future<void> changePage(int _index) async {
    if (Get.currentRoute == root) {
      await changePageInRoot(_index);
    } else {
      await changePageOutRoot(_index);
    }
  }

  Future<void> refreshPage(int _index) async {
    switch (_index) {
      case 0:
        {
          await Get.find<HomeController>().refreshHome();
          break;
        }
    }
  }
}
