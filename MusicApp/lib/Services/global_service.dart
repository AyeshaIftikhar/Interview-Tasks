import 'package:get/get.dart';
import 'package:musicapp/Helper/helper.dart';
import 'package:musicapp/Model/global_model.dart';

class GlobalService extends GetxService {
  final global = Global().obs;

  Future<GlobalService> init() async {
    var response = await Helper.getJsonFile('configs/configs.json');
    global.value = Global.fromJson(response);
    return this;
  }

  String get baseUrl => global.value.baseUrl!;
}