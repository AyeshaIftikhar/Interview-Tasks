import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:musicapp/Mixin/api_client.dart';
import 'package:musicapp/Model/searched_tracks.dart';
import 'package:musicapp/Model/top_tracks.dart';
import 'package:musicapp/Model/track_details.dart';

class ApiProviderClient extends GetxService with ApiClient {
  late Dio _httpClient;
  late Options _optionsNetwork;
  // ignore: unused_field
  late Options _optionsCache;

  ApiProviderClient() {
    baseUrl = globalService.global.value.baseUrl!;
    _httpClient = Dio();
  }

  Future<ApiProviderClient> init() async {
    _optionsNetwork =
        buildCacheOptions(const Duration(days: 3), forceRefresh: true);
    _optionsCache =
        buildCacheOptions(const Duration(minutes: 10), forceRefresh: false);
    _httpClient.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: getApiBaseUrl(""))).interceptor);

    return this;
  }

  void forceRefresh({Duration duration = const Duration(minutes: 10)}) {
    _optionsCache = buildCacheOptions(duration, forceRefresh: true);
  }

  void unForceRefresh({Duration duration = const Duration(minutes: 10)}) {
    _optionsCache = buildCacheOptions(duration, forceRefresh: false);
  }

  /// get top tracks
  Future<TopTracks> getTopTracks() async {
    Uri uri = getApiBaseUri(
      path:
          '/?method=chart.gettoptracks&limit=15&api_key=8665b1d77ac5521a01aa33ab6ca43fc9&format=json',
    );
    Get.log('Top Tracks: $uri');
    try {
      var response = await _httpClient.getUri(uri, options: _optionsNetwork);
      // debugPrint(response.data.toString());
      return TopTracks.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<SearchedTracks> getSearchedTracks(String text) async {
    Uri uri = getApiBaseUri(
      path:
          '/?method=track.search&track=$text&api_key=8665b1d77ac5521a01aa33ab6ca43fc9&format=json',
    );
    Get.log('Search Tracks: $uri');
    try {
      var response = await _httpClient.getUri(uri, options: _optionsNetwork);
      // debugPrint(response.data.toString());
      return SearchedTracks.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<TrackDetails> getTrackDetails(String track, String artist) async {
    Uri uri = getApiBaseUri(
      path:
          '/?method=track.getInfo&api_key=8665b1d77ac5521a01aa33ab6ca43fc9&artist=$artist&track=$track&format=json',
    );
    Get.log('Track Details: $uri');
    try {
      var response = await _httpClient.getUri(uri, options: _optionsNetwork);
      // debugPrint(response.data.toString());
      return TrackDetails.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

}
