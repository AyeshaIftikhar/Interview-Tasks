import 'package:get/get.dart';
import 'package:musicapp/Model/top_tracks.dart';
import 'package:musicapp/providers/api_provider.dart';

class HomeRepository {
  late ApiProviderClient _laravelApiClient;

  HomeRepository() {
    _laravelApiClient = Get.find<ApiProviderClient>();
  }

  Future<TopTracks> getTopTracks() {
    return _laravelApiClient.getTopTracks();
  }
}
