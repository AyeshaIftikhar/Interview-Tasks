import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(body: controller.currentPage),
    );
  }
}
