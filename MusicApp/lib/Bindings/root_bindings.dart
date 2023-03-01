import 'package:get/get.dart';
import 'package:musicapp/Controllers/home_controller.dart';
import 'package:musicapp/Controllers/root_controller.dart';
import 'package:musicapp/Controllers/search_controller.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
