import 'package:get/get.dart';
import 'package:musicapp/Widgets/progress_indicator.dart';

loadingDialog() => Get.dialog(progressIndicator(), barrierDismissible: false);
