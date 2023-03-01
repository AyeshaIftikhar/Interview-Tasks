import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Model/searched_tracks.dart';
import 'package:musicapp/repositories/search_repo.dart';

class SearchController extends GetxController {
  TextEditingController search = TextEditingController();
  late SearchRepository _searchRepository;

  Rx<SearchedTracks> searchTracks = SearchedTracks().obs;
  RxList<Track> tracklist = <Track>[].obs;
  RxList<String> images = <String>[].obs;

  RxBool searching = false.obs;

  SearchController() {
    _searchRepository = SearchRepository();
  }

  Future getSearchedProposals() async {
    Get.focusScope!.unfocus(); 
    try {
      searching.value = true;
      searchTracks.value =
          await _searchRepository.getSearchTracks(search.text);
      await setFetchedData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future setFetchedData() async {
    tracklist.assignAll(searchTracks.value.results!.trackmatches!.track!);
    for (int i = 0; i < tracklist.length; i++) {
      var _track = tracklist[i];
      for (int j = 0; j < _track.image!.length; j++) {
        images.add(_track.image![j].text!);
      }
    }
  }

  void clearSearch() {
    searching.value = false;
    search.clear();
  }
}
