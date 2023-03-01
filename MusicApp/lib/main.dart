import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musicapp/providers/api_provider.dart';
import 'Services/global_service.dart';
import 'my_app.dart';

initServices() async {
  Get.log('initializing services');
  await GetStorage.init();
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => ApiProviderClient().init());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
} 