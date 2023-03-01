import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Common/ui.dart';
import 'package:musicapp/Model/track_details.dart';
import 'package:musicapp/repositories/search_repo.dart';

class TrackDetailsController extends GetxController {
  late SearchRepository _searchRepository;
  var parameters = Get.parameters;

  RxString trackName = ''.obs;
  RxString artistName = ''.obs;
  RxBool searching = true.obs;

  Rx<TrackDetails> trackDetails = TrackDetails().obs;
  Rx<Track> track = Track().obs;
  Rx<Artist> artist = Artist().obs;
  Rx<Album> album = Album().obs;
  Rx<Wiki> wiki = Wiki().obs;

  TrackDetailsController() {
    _searchRepository = SearchRepository();
  }

  @override
  void onInit() async {
    super.onInit();
    getData();
    await refreshTrackDetail();
  }

  getData() {
    trackName.value = parameters['track_name']!;
    artistName.value = parameters['artist_name']!;
  }

  Future refreshTrackDetail({bool showMessage = false}) async {
    await getTrackDetail();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Refreshed successfully".tr));
    }
  }

  Future getTrackDetail() async {
    try {
      trackDetails.value = await _searchRepository.getTrackDetails(
        artistName.value,
        trackName.value,
      );
      await setFetchedData();
      searching.value = false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future setFetchedData() async {
    track.value = trackDetails.value.track!;
    artist.value = track.value.artist!;
    album.value = track.value.album!;
    wiki.value = track.value.wiki!;
  }
}
