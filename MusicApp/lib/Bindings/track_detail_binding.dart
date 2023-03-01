
import 'package:get/get.dart';
import 'package:musicapp/Controllers/track_details.dart';



class TrackDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TrackDetailsController>(() => TrackDetailsController());
  }

}