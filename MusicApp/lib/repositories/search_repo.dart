import 'package:get/get.dart';
import 'package:musicapp/Model/searched_tracks.dart';
import 'package:musicapp/Model/track_details.dart';
import 'package:musicapp/providers/api_provider.dart';

class SearchRepository {
  late ApiProviderClient _laravelApiClient;

  SearchRepository() {
    _laravelApiClient = Get.find<ApiProviderClient>();
  }

  Future<SearchedTracks> getSearchTracks(String text) {
    return _laravelApiClient.getSearchedTracks(text);
  }

  Future<TrackDetails> getTrackDetails(String artist, String track) {
    return _laravelApiClient.getTrackDetails(track, artist);
  }

}
